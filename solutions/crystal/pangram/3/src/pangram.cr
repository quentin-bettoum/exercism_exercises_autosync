class Pangram
  def self.pangram?(input : String) : Bool
    26 == input.downcase.chars.select(&.ascii_letter?).uniq!.size
  end

  # def self.pangram?(input : String) : Bool
  #   input = input.downcase
  #   ('a'..'z').all? { |char| input.includes?(char) }
  # end
end
