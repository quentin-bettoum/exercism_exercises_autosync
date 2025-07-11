defmodule DateParser do
  def day(), do: "((?!00)[0-2][0-9]|[1-9]|3[0-1])"

  def month(), do: "(1[0-2]|0[1-9]|[1-9])"

  def year(), do: "([1-9]){1}([0-9]){3}"

  def day_names(), do: "(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)"

  def month_names(), do: "(January|February|March|April|May|June|July|August|September|October|November|December)"

  def capture_day(), do: "(?<day>#{day()})"

  def capture_month(), do: "(?<month>#{month()})"

  def capture_year(), do: "(?<year>#{year()})"

  def capture_day_name(), do: "(?<day_name>#{day_names()})"

  def capture_month_name(), do: "(?<month_name>#{month_names()})"

  def capture_numeric_date(), do: "#{capture_day()}\/#{capture_month()}\/#{capture_year()}"

  def capture_month_name_date(), do: "#{capture_month_name()} #{capture_day()}, #{capture_year()}"

  def capture_day_month_name_date(), do: "#{capture_day_name()}, #{capture_month_name_date()}"

  def match_numeric_date() do
    "^#{capture_numeric_date()}$"
    |> Regex.compile!
  end

  def match_month_name_date() do
    "^#{capture_month_name_date()}$"
    |> Regex.compile!
  end

  def match_day_month_name_date() do
    "^#{capture_day_month_name_date()}$"
    |> Regex.compile!
  end
end
