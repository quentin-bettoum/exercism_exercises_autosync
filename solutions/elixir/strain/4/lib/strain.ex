defmodule Strain do
  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns true.

  Do not use `Enum.filter`.
  """
  @spec keep(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def keep(list, fun) do
    for el <- list, fun.(el), do: el
  end

  @doc """
  Given a `list` of items and a function `fun`, return the list of items where
  `fun` returns false.

  Do not use `Enum.reject`.
  """
  @spec discard(list :: list(any), fun :: (any -> boolean)) :: list(any)
  def discard(list, fun) do
    for el <- list, not fun.(el), do: el
  end

  # def keep(list, fun), do: filter(list, fun)
  # def discard(list, fun), do: filter(list, & not fun.(&1))

  # defp filter([head | tail], pred), do: pred.(head) and [head | filter(tail, pred)] || filter(tail, pred)
  # defp filter(list, _), do: list
end
