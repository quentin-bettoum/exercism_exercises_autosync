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

  def display_battery(%__MODULE__{battery_percentage: battery}) do
    case battery do
      0 -> "Battery empty"
      n -> "Battery at #{n}%"
    end
  end

  def drive(%__MODULE__{} = remote_car) do
    case remote_car.battery_percentage do
      0 -> remote_car
      n -> %{
        remote_car |
        battery_percentage: n - 1,
        distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
      }
    end
  end
end
