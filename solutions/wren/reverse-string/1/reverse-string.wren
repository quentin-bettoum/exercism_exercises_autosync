class StringUtil {
  static reverse(string) {
    var reversed = ""

    for (char in string) {
      reversed = char + reversed
    }

    return reversed
  }
}
