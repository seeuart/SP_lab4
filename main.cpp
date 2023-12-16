#include "calculator.h"
#include <iostream>

int main(int argc, char* argv[])
{
  double a = 7.2;
  double b = 4.8;
  double c = -1.2;
  double result;

  result = Calculator::Add(a, b);
  result = Calculator::Mul(result, c);

  std::cout << "Result: " << result << std::endl;

  return 0;
}