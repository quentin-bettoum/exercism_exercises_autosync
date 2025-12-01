class Year {
  static isLeap(n) {
    var divisibleBy4 = n % 4 == 0
    var divisibleBy100 = n % 100 == 0
    var divisibleBy400 = n % 400 == 0

    return divisibleBy400 || divisibleBy4 && !divisibleBy100
  }
}
