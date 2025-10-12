module Isogram
  def self.isogram?(phrase : String) : Bool
    characters = phrase.downcase.chars.select(&.letter?)
    characters == characters.uniq
  end
end
