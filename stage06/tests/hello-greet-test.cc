#include "../main/hello-greet.h"

#include "gtest/gtest.h"

TEST(Simple, ReturnHi) {
  std::string actual = get_greet("Test");
  std::string expected = "Hello Test";
  EXPECT_EQ(expected, actual);
}
