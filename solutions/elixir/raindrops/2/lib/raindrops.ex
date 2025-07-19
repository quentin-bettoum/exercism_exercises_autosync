defmodule Raindrops do
  @raindrops %{
    3 => "Pling",
    5 => "Plang",
    7 => "Plong"
  }
  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t()
  def convert(number) do
    @raindrops
    |> Enum.map(fn {k, v} -> if Integer.mod(number, k) === 0, do: v, else: "" end)
    |> List.to_string()
    |> then(&if String.length(&1) > 0, do: &1, else: to_string(number))
  end
end
