defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name(), do: IO.gets("What is your character's name?\n") |> String.replace("\n", "")

  def ask_class(), do: IO.gets("What is your character's class?\n") |> String.replace("\n", "")

  def ask_level(), do: IO.gets("What is your character's level?\n") |> String.replace("\n", "") |> String.to_integer()

  def run() do
    welcome()
    character_map = %{
      name: ask_name(),
      class: ask_class(),
      level: ask_level()
    }
    IO.write("Your character: ")
    IO.inspect(character_map)
    character_map
  end
end
