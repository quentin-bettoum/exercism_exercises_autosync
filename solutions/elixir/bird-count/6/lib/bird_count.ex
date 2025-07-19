defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: hd(list)

  def increment_day_count([]), do: [1]
  def increment_day_count([head | tail]), do: [head + 1 | tail]

  def has_day_without_birds?([head | tail]), do: head === 0 or has_day_without_birds?(tail)
  def has_day_without_birds?(n), do: n === 0

  def total([]), do: 0
  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0
  def busy_days([head | tail]) when head >= 5, do: busy_days(tail) + 1
  def busy_days([_head | tail]), do: busy_days(tail)
end
