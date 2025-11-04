module ScrabbleScore
  extend self

  def score(word : String) : Int32
    word.downcase.chars.sum(&->char_score(Char))
  end

  def char_score(char : Char) : Int32
    case char
    when .in_set? "aeioulnrst" then 1
    when .in_set? "dg"         then 2
    when .in_set? "bcmp"       then 3
    when .in_set? "fhvwy"      then 4
    when .in_set? "jx"         then 8
    when .in_set? "qz"         then 10
    else                            5
    end
  end
end
