defmodule RemoteControlCar do
  @enforce_keys [:nickname]

  defstruct [
    :nickname,
    distance_driven_in_meters: 0,
    battery_percentage: 100
  ]

  def new(nickname \\ "none"), do: %__MODULE__{nickname: nickname}

  def display_distance(%__MODULE__{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%__MODULE__{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%__MODULE__{battery_percentage: percentage}) do
    "Battery at #{percentage}%"
  end

  def drive(%__MODULE__{battery_percentage: 0} = remote_car), do: remote_car

  def drive(%__MODULE__{} = remote_car) do
    remote_car
    |> Map.update!(:battery_percentage, &(&1 - 1))
    |> Map.update!(:distance_driven_in_meters, &(&1 + 20))
  end
end
