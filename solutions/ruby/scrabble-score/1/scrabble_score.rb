# frozen_string_literal: true

# Scrabble score
class Scrabble
  def initialize(word)
    @word = word
  end

  def score
    @word.downcase.chars.reduce(0) { |acc, char| acc + char_score(char) }
  end

  private

  def char_score(char)
    if 'aeioulnrst'.include?(char) then 1
    elsif 'dg'.include?(char) then 2
    elsif 'bcmp'.include?(char) then 3
    elsif 'fhvwy'.include?(char) then 4
    elsif char == 'k' then 5
    elsif 'jx'.include?(char) then 8
    elsif 'qz'.include?(char) then 10
    else
      0
    end
  end
end
