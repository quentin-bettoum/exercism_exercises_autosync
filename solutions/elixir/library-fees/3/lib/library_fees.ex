defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    days_to_return = if before_noon?(checkout_datetime), do: 28, else: 29
    NaiveDateTime.to_date(checkout_datetime) |> Date.add(days_to_return)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    Date.diff(actual_return_datetime, planned_return_date)
    |> then(fn n -> if n > 0, do: n, else: 0 end)
  end

  def monday?(datetime), do: Date.day_of_week(datetime) === 1

  def calculate_late_fee(checkout, return, rate) do
    return_datetime = datetime_from_string(return)
    planned_return = datetime_from_string(checkout) |> return_date()
    days_late = days_late(planned_return, return_datetime)

    (rate * days_late)
    |> then(fn n -> if monday?(return_datetime), do: n / 2, else: n end)
    |> floor
  end
end
