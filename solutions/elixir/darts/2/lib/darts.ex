defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    euclidean_distance = :math.sqrt(x*x + y*y)

    cond do
      euclidean_distance <= 1 -> 10
      euclidean_distance <= 5 -> 5
      euclidean_distance <= 10 -> 1
      true -> 0
    end
  end
end
