defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    distance_driven_in_meters: 0,
    battery_percentage: 100
  ]

  def new(nickname \\ "none"), do: %RemoteControlCar{nickname: nickname}

  def display_distance(%RemoteControlCar{distance_driven_in_meters: distance}) do
    "#{distance} meters"
  end

  def display_battery(%RemoteControlCar{battery_percentage: battery}) do
    state = if battery === 0, do: "empty", else: "at #{battery}%"
    "Battery #{state}"
  end

  def drive(%RemoteControlCar{} = remote_car) do
    if remote_car.battery_percentage > 0 do
      remote_car
      |> Map.put(
        :distance_driven_in_meters,
        remote_car.distance_driven_in_meters + 20
        )
      |> Map.put(
        :battery_percentage,
        remote_car.battery_percentage - 1
      )
    else
      remote_car
    end
  end
end
