module Anagram
  extend self

  def find(subject : String, candidates : Array(String)) : Array(String)
    subject_down = subject.downcase
    sorted_subject = sort_chars(subject_down)

    candidates.select do |cand|
      cand_down = cand.downcase
      cand_down != subject_down && sort_chars(cand_down) == sorted_subject
    end
  end

  private def sort_chars(str : String) : Array(Char)
    # str.chars.sort!.tally
    str.chars.sort!
  end
end
