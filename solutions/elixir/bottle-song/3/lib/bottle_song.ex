defmodule BottleSong do
  @moduledoc """
  Handles lyrics of the popular children song: Ten Green Bottles
  """

  @numbers_mapping 0..10
    |> Enum.zip(["no", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten"])
    |> Enum.into(%{}, fn {k, v} -> {k, v} end)

  @spec recite(pos_integer, pos_integer) :: String.t()
  def recite(start_bottle, take_down) do
    start_bottle..(start_bottle - take_down + 1)//-1
    |> Enum.reduce([], fn count, acc -> acc ++ [lyrics(count)] end)
    |> Enum.join("\n\n")
  end

  defp lyrics(count) do
    nbr_str = String.capitalize(@numbers_mapping[count])

    String.trim("""
    #{nbr_str} green #{bottle(count)} hanging on the wall,
    #{nbr_str} green #{bottle(count)} hanging on the wall,
    And if one green #{bottle(1)} should accidentally fall,
    There'll be #{@numbers_mapping[count - 1]} green #{bottle(count - 1)} hanging on the wall.
    """)
  end

  defp bottle(1), do: "bottle"
  defp bottle(_), do: "bottles"
end
