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
    "#{nbr_str} #{green_bottle(count)} hanging on the wall,\n" <>
    "#{nbr_str} #{green_bottle(count)} hanging on the wall,\n" <>
    "And if one #{green_bottle(1)} should accidentally fall,\n" <>
    "There'll be #{@numbers_mapping[count - 1]} #{green_bottle(count - 1)} hanging on the wall."
  end

  defp green_bottle(1), do: "green bottle"
  defp green_bottle(_), do: "green bottles"
end
