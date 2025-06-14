# frozen_string_literal: true

# Character generator for the game Dungeons & Dragons
class DndCharacter
  BASE_HITPOINTS = 10

  attr_reader :strength, :dexterity, :constitution, :intelligence, :wisdom, :charisma, :hitpoints

  def self.modifier(constitution)
    ((constitution - 10) / 2)
  end

  def initialize
    @strength = ability
    @dexterity = ability
    @constitution = ability
    @intelligence = ability
    @wisdom = ability
    @charisma = ability
    @hitpoints = BASE_HITPOINTS + self.class.modifier(@constitution)
  end

  private

  def ability
    Random.rand(3..18)
  end
end
