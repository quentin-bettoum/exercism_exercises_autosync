# frozen_string_literal: true

# Determine if a word or phrase is an isogram.
module Isogram
  def self.isogram?(word)
    chars = word.downcase.chars.filter { |c| !['-', ' '].include?(c) }
    chars.uniq.eql?(chars)
  end
end
