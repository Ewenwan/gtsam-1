/*
 * @file testEssentialMatrixFactor.cpp
 * @brief Test EssentialMatrixFactor class
 * @author Frank Dellaert
 * @date December 17, 2013
 */

#include <gtsam/slam/EssentialMatrixFactor.h>

#include <gtsam/slam/dataset.h>
#include <gtsam/nonlinear/NonlinearFactorGraph.h>
#include <gtsam/nonlinear/LevenbergMarquardtOptimizer.h>
#include <gtsam/geometry/CalibratedCamera.h>
#include <gtsam/base/Testable.h>
#include <gtsam/base/numericalDerivative.h>

#include <CppUnitLite/TestHarness.h>

using namespace std;
using namespace gtsam;

// Noise model for first type of factor is evaluating algebraic error
noiseModel::Isotropic::shared_ptr model1 = noiseModel::Isotropic::Sigma(1,
    0.01);
// Noise model for second type of factor is evaluating pixel coordinates
noiseModel::Unit::shared_ptr model2 = noiseModel::Unit::Create(2);

// The rotation between body and camera is:
gtsam::Point3 bX(1, 0, 0), bY(0, 1, 0), bZ(0, 0, 1);
gtsam::Rot3 cRb = gtsam::Rot3(bX, bZ, -bY).inverse();

namespace example1 {

const string filename = findExampleDataFile("5pointExample1.txt");
SfM_data data;
bool readOK = readBAL(filename, data);
Rot3 c1Rc2 = data.cameras[1].pose().rotation();
Point3 c1Tc2 = data.cameras[1].pose().translation();
PinholeCamera<Cal3_S2> camera2(data.cameras[1].pose(),Cal3_S2());
EssentialMatrix trueE(c1Rc2, Unit3(c1Tc2));
double baseline = 0.1; // actual baseline of the camera

Point2 pA(size_t i) {
  return data.tracks[i].measurements[0].second;
}
Point2 pB(size_t i) {
  return data.tracks[i].measurements[1].second;
}
Vector vA(size_t i) {
  return EssentialMatrix::Homogeneous(pA(i));
}
Vector vB(size_t i) {
  return EssentialMatrix::Homogeneous(pB(i));
}

//*************************************************************************
TEST (EssentialMatrixFactor, testData) {
  CHECK(readOK);

  // Check E matrix
  Matrix expected(3, 3);
  expected << 0, 0, 0, 0, 0, -0.1, 0.1, 0, 0;
  Matrix aEb_matrix = skewSymmetric(c1Tc2.x(), c1Tc2.y(), c1Tc2.z())
      * c1Rc2.matrix();
  EXPECT(assert_equal(expected, aEb_matrix, 1e-8));

  // Check some projections
  EXPECT(assert_equal(Point2(0, 0), pA(0), 1e-8));
  EXPECT(assert_equal(Point2(0, 0.1), pB(0), 1e-8));
  EXPECT(assert_equal(Point2(0, -1), pA(4), 1e-8));
  EXPECT(assert_equal(Point2(-1, 0.2), pB(4), 1e-8));

  // Check homogeneous version
  EXPECT(assert_equal((Vector(3) << -1, 0.2, 1), vB(4), 1e-8));

  // Check epipolar constraint
  for (size_t i = 0; i < 5; i++)
    EXPECT_DOUBLES_EQUAL(0, vA(i).transpose() * aEb_matrix * vB(i), 1e-8);

  // Check epipolar constraint
  for (size_t i = 0; i < 5; i++)
    EXPECT_DOUBLES_EQUAL(0, trueE.error(vA(i), vB(i)), 1e-7);
}

//*************************************************************************
TEST (EssentialMatrixFactor, factor) {
  for (size_t i = 0; i < 5; i++) {
    EssentialMatrixFactor factor(1, pA(i), pB(i), model1);

    // Check evaluation
    Vector expected(1);
    expected << 0;
    Matrix Hactual;
    Vector actual = factor.evaluateError(trueE, Hactual);
    EXPECT(assert_equal(expected, actual, 1e-7));

    // Use numerical derivatives to calculate the expected Jacobian
    Matrix Hexpected;
    Hexpected = numericalDerivative11<EssentialMatrix>(
        boost::bind(&EssentialMatrixFactor::evaluateError, &factor, _1,
            boost::none), trueE);

    // Verify the Jacobian is correct
    EXPECT(assert_equal(Hexpected, Hactual, 1e-8));
  }
}

//*************************************************************************
TEST (EssentialMatrixFactor, minimization) {
  // Here we want to optimize directly on essential matrix constraints
  // Yi Ma's algorithm (Ma01ijcv) is a bit cumbersome to implement,
  // but GTSAM does the equivalent anyway, provided we give the right
  // factors. In this case, the factors are the constraints.

  // We start with a factor graph and add constraints to it
  // Noise sigma is 1cm, assuming metric measurements
  NonlinearFactorGraph graph;
  for (size_t i = 0; i < 5; i++)
    graph.add(EssentialMatrixFactor(1, pA(i), pB(i), model1));

  // Check error at ground truth
  Values truth;
  truth.insert(1, trueE);
  EXPECT_DOUBLES_EQUAL(0, graph.error(truth), 1e-8);

  // Check error at initial estimate
  Values initial;
  EssentialMatrix initialE = trueE.retract(
      (Vector(5) << 0.1, -0.1, 0.1, 0.1, -0.1));
  initial.insert(1, initialE);
#if defined(GTSAM_ROT3_EXPMAP) || defined(GTSAM_USE_QUATERNIONS)
  EXPECT_DOUBLES_EQUAL(643.26, graph.error(initial), 1e-2);
#else
  EXPECT_DOUBLES_EQUAL(639.84, graph.error(initial), 1e-2);
#endif

  // Optimize
  LevenbergMarquardtParams parameters;
  LevenbergMarquardtOptimizer optimizer(graph, initial, parameters);
  Values result = optimizer.optimize();

  // Check result
  EssentialMatrix actual = result.at<EssentialMatrix>(1);
  EXPECT(assert_equal(trueE, actual, 1e-1));

  // Check error at result
  EXPECT_DOUBLES_EQUAL(0, graph.error(result), 1e-4);

  // Check errors individually
  for (size_t i = 0; i < 5; i++)
    EXPECT_DOUBLES_EQUAL(0, actual.error(vA(i), vB(i)), 1e-6);

}

//*************************************************************************
TEST (EssentialMatrixFactor2, factor) {
  for (size_t i = 0; i < 5; i++) {
    EssentialMatrixFactor2 factor(100, i, pA(i), pB(i), model2);

    // Check evaluation
    Point3 P1 = data.tracks[i].p, P2 = data.cameras[1].pose().transform_to(P1);
    const Point2 pi = SimpleCamera::project_to_camera(P2);
    Point2 reprojectionError(pi - pB(i));
    Vector expected = reprojectionError.vector();

    Matrix Hactual1, Hactual2;
    LieScalar d(baseline / P1.z());
    Vector actual = factor.evaluateError(trueE, d, Hactual1, Hactual2);
    EXPECT(assert_equal(expected, actual, 1e-7));

    // Use numerical derivatives to calculate the expected Jacobian
    Matrix Hexpected1, Hexpected2;
    boost::function<Vector(const EssentialMatrix&, const LieScalar&)> f =
        boost::bind(&EssentialMatrixFactor2::evaluateError, &factor, _1, _2,
            boost::none, boost::none);
    Hexpected1 = numericalDerivative21<EssentialMatrix>(f, trueE, d);
    Hexpected2 = numericalDerivative22<EssentialMatrix>(f, trueE, d);

    // Verify the Jacobian is correct
    EXPECT(assert_equal(Hexpected1, Hactual1, 1e-8));
    EXPECT(assert_equal(Hexpected2, Hactual2, 1e-8));
  }
}

//*************************************************************************
TEST (EssentialMatrixFactor2, minimization) {
  // Here we want to optimize for E and inverse depths at the same time

  // We start with a factor graph and add constraints to it
  // Noise sigma is 1cm, assuming metric measurements
  NonlinearFactorGraph graph;
  for (size_t i = 0; i < 5; i++)
    graph.add(EssentialMatrixFactor2(100, i, pA(i), pB(i), model2));

  // Check error at ground truth
  Values truth;
  truth.insert(100, trueE);
  for (size_t i = 0; i < 5; i++) {
    Point3 P1 = data.tracks[i].p;
    truth.insert(i, LieScalar(baseline / P1.z()));
  }
  EXPECT_DOUBLES_EQUAL(0, graph.error(truth), 1e-8);

  // Optimize
  LevenbergMarquardtParams parameters;
  // parameters.setVerbosity("ERROR");
  LevenbergMarquardtOptimizer optimizer(graph, truth, parameters);
  Values result = optimizer.optimize();

  // Check result
  EssentialMatrix actual = result.at<EssentialMatrix>(100);
  EXPECT(assert_equal(trueE, actual, 1e-1));
  for (size_t i = 0; i < 5; i++)
    EXPECT(assert_equal(truth.at<LieScalar>(i), result.at<LieScalar>(i), 1e-1));

  // Check error at result
  EXPECT_DOUBLES_EQUAL(0, graph.error(result), 1e-4);
}

//*************************************************************************
// Below we want to optimize for an essential matrix specified in a
// body coordinate frame B which is rotated with respect to the camera
// frame C, via the rotation bRc.

// The "true E" in the body frame is then
EssentialMatrix bodyE = cRb.inverse() * trueE;

//*************************************************************************
TEST (EssentialMatrixFactor3, factor) {

  for (size_t i = 0; i < 5; i++) {
    EssentialMatrixFactor3 factor(100, i, pA(i), pB(i), cRb, model2);

    // Check evaluation
    Point3 P1 = data.tracks[i].p;
    const Point2 pi = camera2.project(P1);
    Point2 reprojectionError(pi - pB(i));
    Vector expected = reprojectionError.vector();

    Matrix Hactual1, Hactual2;
    LieScalar d(baseline / P1.z());
    Vector actual = factor.evaluateError(bodyE, d, Hactual1, Hactual2);
    EXPECT(assert_equal(expected, actual, 1e-7));

    // Use numerical derivatives to calculate the expected Jacobian
    Matrix Hexpected1, Hexpected2;
    boost::function<Vector(const EssentialMatrix&, const LieScalar&)> f =
        boost::bind(&EssentialMatrixFactor3::evaluateError, &factor, _1, _2,
            boost::none, boost::none);
    Hexpected1 = numericalDerivative21<EssentialMatrix>(f, bodyE, d);
    Hexpected2 = numericalDerivative22<EssentialMatrix>(f, bodyE, d);

    // Verify the Jacobian is correct
    EXPECT(assert_equal(Hexpected1, Hactual1, 1e-8));
    EXPECT(assert_equal(Hexpected2, Hactual2, 1e-8));
  }
}

//*************************************************************************
TEST (EssentialMatrixFactor3, minimization) {

  // As before, we start with a factor graph and add constraints to it
  NonlinearFactorGraph graph;
  for (size_t i = 0; i < 5; i++)
    // but now we specify the rotation bRc
    graph.add(EssentialMatrixFactor3(100, i, pA(i), pB(i), cRb, model2));

  // Check error at ground truth
  Values truth;
  truth.insert(100, bodyE);
  for (size_t i = 0; i < 5; i++) {
    Point3 P1 = data.tracks[i].p;
    truth.insert(i, LieScalar(baseline / P1.z()));
  }
  EXPECT_DOUBLES_EQUAL(0, graph.error(truth), 1e-8);

  // Optimize
  LevenbergMarquardtParams parameters;
  // parameters.setVerbosity("ERROR");
  LevenbergMarquardtOptimizer optimizer(graph, truth, parameters);
  Values result = optimizer.optimize();

  // Check result
  EssentialMatrix actual = result.at<EssentialMatrix>(100);
  EXPECT(assert_equal(bodyE, actual, 1e-1));
  for (size_t i = 0; i < 5; i++)
    EXPECT(assert_equal(truth.at<LieScalar>(i), result.at<LieScalar>(i), 1e-1));

  // Check error at result
  EXPECT_DOUBLES_EQUAL(0, graph.error(result), 1e-4);
}

} // namespace example1

//*************************************************************************

namespace example2 {

const string filename = findExampleDataFile("5pointExample2.txt");
SfM_data data;
bool readOK = readBAL(filename, data);
Rot3 aRb = data.cameras[1].pose().rotation();
Point3 aTb = data.cameras[1].pose().translation();
EssentialMatrix trueE(aRb, Unit3(aTb));

double baseline = 10; // actual baseline of the camera

Point2 pA(size_t i) {
  return data.tracks[i].measurements[0].second;
}
Point2 pB(size_t i) {
  return data.tracks[i].measurements[1].second;
}

boost::shared_ptr<Cal3Bundler> //
K = boost::make_shared<Cal3Bundler>(500, 0, 0);
PinholeCamera<Cal3Bundler> camera2(data.cameras[1].pose(),*K);

Vector vA(size_t i) {
  Point2 xy = K->calibrate(pA(i));
  return EssentialMatrix::Homogeneous(xy);
}
Vector vB(size_t i) {
  Point2 xy = K->calibrate(pB(i));
  return EssentialMatrix::Homogeneous(xy);
}

//*************************************************************************
TEST (EssentialMatrixFactor, extraMinimization) {
  // Additional test with camera moving in positive X direction

  NonlinearFactorGraph graph;
  for (size_t i = 0; i < 5; i++)
    graph.add(EssentialMatrixFactor(1, pA(i), pB(i), model1, K));

  // Check error at ground truth
  Values truth;
  truth.insert(1, trueE);
  EXPECT_DOUBLES_EQUAL(0, graph.error(truth), 1e-8);

  // Check error at initial estimate
  Values initial;
  EssentialMatrix initialE = trueE.retract(
      (Vector(5) << 0.1, -0.1, 0.1, 0.1, -0.1));
  initial.insert(1, initialE);

#if defined(GTSAM_ROT3_EXPMAP) || defined(GTSAM_USE_QUATERNIONS)
  EXPECT_DOUBLES_EQUAL(643.26, graph.error(initial), 1e-2);
#else
  EXPECT_DOUBLES_EQUAL(639.84, graph.error(initial), 1e-2);
#endif

  // Optimize
  LevenbergMarquardtParams parameters;
  LevenbergMarquardtOptimizer optimizer(graph, initial, parameters);
  Values result = optimizer.optimize();

  // Check result
  EssentialMatrix actual = result.at<EssentialMatrix>(1);
  EXPECT(assert_equal(trueE, actual, 1e-1));

  // Check error at result
  EXPECT_DOUBLES_EQUAL(0, graph.error(result), 1e-4);

  // Check errors individually
  for (size_t i = 0; i < 5; i++)
    EXPECT_DOUBLES_EQUAL(0, actual.error(vA(i), vB(i)), 1e-6);

}

//*************************************************************************
TEST (EssentialMatrixFactor2, extraTest) {
  for (size_t i = 0; i < 5; i++) {
    EssentialMatrixFactor2 factor(100, i, pA(i), pB(i), model2, K);

    // Check evaluation
    Point3 P1 = data.tracks[i].p;
    const Point2 pi = camera2.project(P1);
    Point2 reprojectionError(pi - pB(i));
    Vector expected = reprojectionError.vector();

    Matrix Hactual1, Hactual2;
    LieScalar d(baseline / P1.z());
    Vector actual = factor.evaluateError(trueE, d, Hactual1, Hactual2);
    EXPECT(assert_equal(expected, actual, 1e-7));

    // Use numerical derivatives to calculate the expected Jacobian
    Matrix Hexpected1, Hexpected2;
    boost::function<Vector(const EssentialMatrix&, const LieScalar&)> f =
        boost::bind(&EssentialMatrixFactor2::evaluateError, &factor, _1, _2,
            boost::none, boost::none);
    Hexpected1 = numericalDerivative21<EssentialMatrix>(f, trueE, d);
    Hexpected2 = numericalDerivative22<EssentialMatrix>(f, trueE, d);

    // Verify the Jacobian is correct
    EXPECT(assert_equal(Hexpected1, Hactual1, 1e-6));
    EXPECT(assert_equal(Hexpected2, Hactual2, 1e-8));
  }
}

//*************************************************************************
TEST (EssentialMatrixFactor2, extraMinimization) {
  // Additional test with camera moving in positive X direction

  // We start with a factor graph and add constraints to it
  // Noise sigma is 1, assuming pixel measurements
  NonlinearFactorGraph graph;
  for (size_t i = 0; i < data.number_tracks(); i++)
    graph.add(EssentialMatrixFactor2(100, i, pA(i), pB(i), model2, K));

  // Check error at ground truth
  Values truth;
  truth.insert(100, trueE);
  for (size_t i = 0; i < data.number_tracks(); i++) {
    Point3 P1 = data.tracks[i].p;
    truth.insert(i, LieScalar(baseline / P1.z()));
  }
  EXPECT_DOUBLES_EQUAL(0, graph.error(truth), 1e-8);

  // Optimize
  LevenbergMarquardtParams parameters;
  // parameters.setVerbosity("ERROR");
  LevenbergMarquardtOptimizer optimizer(graph, truth, parameters);
  Values result = optimizer.optimize();

  // Check result
  EssentialMatrix actual = result.at<EssentialMatrix>(100);
  EXPECT(assert_equal(trueE, actual, 1e-1));
  for (size_t i = 0; i < data.number_tracks(); i++)
    EXPECT(assert_equal(truth.at<LieScalar>(i), result.at<LieScalar>(i), 1e-1));

  // Check error at result
  EXPECT_DOUBLES_EQUAL(0, graph.error(result), 1e-4);
}

//*************************************************************************
TEST (EssentialMatrixFactor3, extraTest) {

  // The "true E" in the body frame is
  EssentialMatrix bodyE = cRb.inverse() * trueE;

  for (size_t i = 0; i < 5; i++) {
    EssentialMatrixFactor3 factor(100, i, pA(i), pB(i), cRb, model2, K);

    // Check evaluation
    Point3 P1 = data.tracks[i].p;
    const Point2 pi = camera2.project(P1);
    Point2 reprojectionError(pi - pB(i));
    Vector expected = reprojectionError.vector();

    Matrix Hactual1, Hactual2;
    LieScalar d(baseline / P1.z());
    Vector actual = factor.evaluateError(bodyE, d, Hactual1, Hactual2);
    EXPECT(assert_equal(expected, actual, 1e-7));

    // Use numerical derivatives to calculate the expected Jacobian
    Matrix Hexpected1, Hexpected2;
    boost::function<Vector(const EssentialMatrix&, const LieScalar&)> f =
        boost::bind(&EssentialMatrixFactor3::evaluateError, &factor, _1, _2,
            boost::none, boost::none);
    Hexpected1 = numericalDerivative21<EssentialMatrix>(f, bodyE, d);
    Hexpected2 = numericalDerivative22<EssentialMatrix>(f, bodyE, d);

    // Verify the Jacobian is correct
    EXPECT(assert_equal(Hexpected1, Hactual1, 1e-6));
    EXPECT(assert_equal(Hexpected2, Hactual2, 1e-8));
  }
}

} // namespace example2

/* ************************************************************************* */
int main() {
  TestResult tr;
  return TestRegistry::runAllTests(tr);
}
/* ************************************************************************* */

