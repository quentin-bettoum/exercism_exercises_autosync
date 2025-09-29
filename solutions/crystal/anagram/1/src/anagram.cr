module Anagram
  extend self

  def find(subject : String, candidates : Array(String)) : Array(String)
    subject_down = subject.downcase
    sorted_subject = sort_str(subject_down)

    candidates.select do |cand|
      cand_down = cand.downcase
      cand_down != subject_down && sort_str(cand_down) == sorted_subject
    end
  end

  private def sort_str(str : String) : String
    str.each_grapheme.to_a.map(&.to_s).sort!.join
  end
end
