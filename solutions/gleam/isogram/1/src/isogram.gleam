import gleam/regexp

pub fn is_isogram(phrase phrase: String) -> Bool {
  let assert Ok(re) =
    regexp.compile(
      "([a-z]).*\\1",
      with: regexp.Options(case_insensitive: True, multi_line: False),
    )

  !regexp.check(re, phrase)
}
