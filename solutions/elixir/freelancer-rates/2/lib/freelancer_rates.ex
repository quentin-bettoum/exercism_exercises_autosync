defmodule FreelancerRates do
  @hours_per_day 8.0
  @days_per_month 22
  @hours_per_month @hours_per_day * @days_per_month

  def daily_rate(hourly_rate) do
    hourly_rate * @hours_per_day
  end

  def apply_discount(before_discount, discount) do
    before_discount - before_discount * discount / 100
  end

  def monthly_rate(hourly_rate, discount) do
    ceil(apply_discount(hourly_rate * @hours_per_month, discount))
  end

  def days_in_budget(budget, hourly_rate, discount) do
    days_in_budget = budget / apply_discount(hourly_rate, discount) / @hours_per_day
    Float.floor(days_in_budget, 1)
  end
end
