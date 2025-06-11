defmodule Allergies do
  @allergies [
    {"cats", 128},
    {"pollen", 64},
    {"chocolate", 32},
    {"tomatoes", 16},
    {"strawberries", 8},
    {"shellfish", 4},
    {"peanuts", 2},
    {"eggs", 1}
  ]

  @doc """
  List the allergies for which the corresponding flag bit is true.
  """
  @spec list(non_neg_integer) :: [String.t()]
  def list(flags), do: flags |> do_list()


  def do_list(flags, allergies \\ @allergies, list \\ [])
  def do_list(flags, allergies, list) when flags > 255, do: do_list(flags - 256, allergies, list)
  def do_list(_, [], list), do: list
  def do_list(flags, [{allergy, bit} | tail], list) do
    cond do
      bit <= flags -> do_list(flags - bit, tail, [allergy | list])
      bit > flags -> do_list(flags, tail, list)
    end
  end


  @doc """
  Returns whether the corresponding flag bit in 'flags' is set for the item.
  """
  @spec allergic_to?(non_neg_integer, String.t()) :: boolean
  def allergic_to?(flags, item) do
    flags
    |> list()
    |> Enum.member?(item)
  end
end
