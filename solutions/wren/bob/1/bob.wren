class Bob {
  static hey(message) {
    message = message.trim()

    if (message.isEmpty) return "Fine. Be that way!"

    var isQuestion = message.endsWith("?")
    var isYelled = this.isYelled(message)

    if (isQuestion && isYelled) return "Calm down, I know what I'm doing!"
    if (isQuestion) return "Sure."
    if (isYelled) return "Whoa, chill out!"

    return "Whatever."
  }

  static isYelled(s) { s.any {|c| "ABCDEFGHIJKLMNOPQRSTUVWXYZ".contains(c) } && !s.any {|c| "abcdefghijklmnopqrstuvwxyz".contains(c) } }
}
