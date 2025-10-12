module Isogram
  def self.isogram?(phrase : String) : Bool
    characters = phrase.downcase.chars.select { |char| !['-', ' '].includes?(char) }
    characters == characters.uniq
  end
end
