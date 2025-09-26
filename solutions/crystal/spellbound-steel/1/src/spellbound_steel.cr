module SpellboundSteel
  extend self

  def find_card?(cards, card)
    cards.index(card)
  end

  def capitalize_names(characters)
    characters.map do |char|
      char.split.map(&.capitalize).join(" ")
    end
  end

  def calculate_power_level(cards)
    cards.reduce(0) do |acc, card|
      acc + case card
      when "Warrior"        then 10
      when "Mage"           then 20
      when "Rogue"          then 30
      when "Fireball"       then 15
      when "Ice Storm"      then 25
      when "Lightning Bolt" then 35
      else                       0
      end
    end
  end

  def decode_characters(character)
    decoded = ""
    character.each_char_with_index do |char, index|
      if index.even?
        decoded += char
      end
    end

    decoded
  end
end
