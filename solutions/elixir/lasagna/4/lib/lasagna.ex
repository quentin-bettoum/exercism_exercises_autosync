defmodule Lasagna do
  @cooking_time 40
  @layer_time 2

  def expected_minutes_in_oven, do: @cooking_time

  def remaining_minutes_in_oven(time), do: expected_minutes_in_oven() - time

  def preparation_time_in_minutes(layers), do: @layer_time * layers

  def total_time_in_minutes(layers, in_oven_time), do: preparation_time_in_minutes(layers) + in_oven_time
  
  def alarm, do: "Ding!"
end
