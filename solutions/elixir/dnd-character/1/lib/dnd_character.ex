defmodule DndCharacter do
  @type t :: %__MODULE__{
          strength: pos_integer(),
          dexterity: pos_integer(),
          constitution: pos_integer(),
          intelligence: pos_integer(),
          wisdom: pos_integer(),
          charisma: pos_integer(),
          hitpoints: pos_integer()
        }

  defstruct ~w[strength dexterity constitution intelligence wisdom charisma hitpoints]a

  @base_hitpoints 10

  @spec modifier(pos_integer()) :: integer()
  def modifier(score), do: floor((score - 10) / 2)

  @spec ability :: pos_integer()
  def ability, do: Enum.random(3..18)

  @spec character :: t()
  def character do
    constitution = ability()

    %__MODULE__{
      strength: ability(),
      dexterity: ability(),
      constitution: constitution,
      intelligence: ability(),
      wisdom: ability(),
      charisma: ability(),
      hitpoints: @base_hitpoints + modifier(constitution)
    }
  end
end
