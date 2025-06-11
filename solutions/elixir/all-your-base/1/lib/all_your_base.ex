defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_, input_base, _) when input_base < 2, do: {:error, "input base must be >= 2"}
  def convert(_, _, output_base) when output_base < 2, do: {:error, "output base must be >= 2"}
  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn x -> x < 0 || x >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      {input_nbr, _} = digits
        |> Enum.reduce("", fn i, acc -> acc <> to_string(i) end)
        |> Integer.parse(input_base)

      {output_nbr, _} = input_nbr
        |> to_string()
        |> Integer.parse(output_base)

      nbr =
        output_nbr
        |> Integer.to_string()
        |> String.graphemes()
        |> Enum.map(&String.to_integer/1)

      {:ok, nbr}
    end
  end
end
