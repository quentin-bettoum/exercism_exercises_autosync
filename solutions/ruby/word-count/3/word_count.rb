# frozen_string_literal: true

# Count words in an input string
class Phrase
  def initialize(str)
    @str = str
  end

  def word_count
    @str
      .downcase
      .scan(/\b[\w']+\b/)
      .tally
  end

  def word_count_bis
    counts = Hash.new(0)

    @str
      .downcase
      .scan(/\b[\w']+\b/)
      .each_entry { |el| counts[el] += 1 }

    counts
  end
end
