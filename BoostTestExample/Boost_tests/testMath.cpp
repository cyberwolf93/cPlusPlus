#define BOOST_TEST_DYN_LINK
#define BOOST_TEST_MAIN
#include <boost/test/unit_test.hpp>
#include "../CustomMath.h"

struct MathFixture {
    CustomMath *obj;

    MathFixture() {
        obj = new CustomMath();
    }

    ~MathFixture() {
        delete obj;
    }
};

BOOST_FIXTURE_TEST_CASE(test_add, MathFixture) {
    obj->setX(1);
    obj->setY(2);
    BOOST_CHECK_EQUAL(obj->add(), 3);
}

BOOST_FIXTURE_TEST_CASE(test_sub, MathFixture) {
    obj->setX(2);
    obj->setY(2);
    BOOST_CHECK_EQUAL(obj->sub(), 0);
}

BOOST_FIXTURE_TEST_CASE(test_mult, MathFixture) {
    obj->setX(1);
    obj->setY(2);
    BOOST_CHECK_EQUAL(obj->mult(), 2);
}

BOOST_FIXTURE_TEST_CASE(test_desc, MathFixture) {
    obj->setX(1);
    obj->setY(2);
    BOOST_CHECK_EQUAL(obj->desc(), "This is the desc of 1 and 2");
}

BOOST_AUTO_TEST_SUITE(MathTestSuite)
    BOOST_AUTO_TEST_CASE(test_add) {
        CustomMath obj;
        obj.setX(1);
        obj.setY(2);
        BOOST_CHECK_EQUAL(obj.add(), 3);
    }
BOOST_AUTO_TEST_SUITE_END()
