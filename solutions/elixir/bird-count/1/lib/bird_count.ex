defmodule BirdCount do
  def today(list), do: List.first(list)

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([head | tail]), do: head === 0 or has_day_without_birds?(tail)
  def has_day_without_birds?(number), do: number === 0

  def total([]), do: 0
  def total([head | tail]), do: total(tail) + head
  def total(number), do: number

  def busy_days(list), do: Enum.count(list, fn x -> x >= 5 end)
end
