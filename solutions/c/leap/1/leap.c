#include "leap.h"

bool leap_year(int year) {
  bool divisibleBy4 = year % 4 == 0;
  bool divisibleBy100 = year % 100 == 0;
  bool divisibleBy400 = year % 400 == 0;

  return divisibleBy400 || (divisibleBy4 && !divisibleBy100);
}
