class Raindrops {
  static convert(n) {
    var str = ""

    if (n % 3 == 0) {
      str = str+("Pling")
    }

    if (n % 5 == 0) {
      str = str+("Plang")
    }

    if (n % 7 == 0) {
      str = str+("Plong")
    }

    if (str == "") {
      return "%(n)"
    }

    return str
  }
}
