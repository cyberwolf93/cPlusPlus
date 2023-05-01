#include "gtest/gtest.h"
#include "../CustomMath.h"

class CustomMathTestFixture : public ::testing::Test {
protected:
    CustomMath *obj;
    virtual void SetUp() {
        obj = new CustomMath();
    }

    virtual void TearDown() {
        delete obj;
    }
};

TEST_F(CustomMathTestFixture, test_add) {
    obj->setX(10);
    obj->setY(20);

    EXPECT_EQ(obj->add(), 30);
}

TEST_F(CustomMathTestFixture, test_sub) {
    obj->setX(10);
    obj->setY(20);

    EXPECT_EQ(obj->sub(), -10);
}

TEST_F(CustomMathTestFixture, test_mult) {
    obj->setX(10);
    obj->setY(20);

    EXPECT_EQ(obj->mult(), 200);
}

TEST_F(CustomMathTestFixture, test_desc) {
    obj->setX(10);
    obj->setY(20);

    EXPECT_EQ(obj->desc(), "This is the desc of 10 and 20");
}


TEST(CustomMathTestSuit, test_add) {
    CustomMath obj;
    obj.setX(3);
    obj.setY(2);

    EXPECT_EQ(obj.add(), 5);
}
