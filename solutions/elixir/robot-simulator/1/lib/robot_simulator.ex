defmodule RobotSimulator do
  @type robot() :: %__MODULE__{direction: direction(), position: position()}
  @type direction() :: :north | :east | :south | :west
  @type position() :: {integer(), integer()}

  defstruct [:direction, :position]

  @directions [:north, :east, :south, :west]

  @doc """
  Create a Robot Simulator given an initial direction and position.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec create(direction, position) :: robot() | {:error, String.t()}
  def create(direction \\ :north, position \\ {0, 0})
  def create(direction, _) when direction not in @directions, do: {:error, "invalid direction"}

  def create(direction, {x, y} = position) when is_integer(x) and is_integer(y) do
    %__MODULE__{position: position, direction: direction}
  end

  def create(_, _), do: {:error, "invalid position"}

  @doc """
  Simulate the robot's movement given a string of instructions.

  Valid instructions are: "R" (turn right), "L", (turn left), and "A" (advance)
  """
  @spec simulate(robot, instructions :: String.t()) :: robot() | {:error, String.t()}
  def simulate(robot, instructions) do
    if instructions_valid?(instructions) do
      instructions
      |> String.graphemes()
      |> Enum.reduce(robot, fn
        "A", %__MODULE__{direction: direction, position: position} = robot ->
          %__MODULE__{robot | position: advance(direction, position)}

        "R", %__MODULE__{} = robot ->
          Map.update!(robot, :direction, &turn_right/1)

        "L", %__MODULE__{} = robot ->
          Map.update!(robot, :direction, &turn_left/1)
      end)
    else
      {:error, "invalid instruction"}
    end
  end

  defp instructions_valid?(instructions), do: Regex.match?(~r/^[RLA]+$/, instructions)

  defp advance(:north, {x, y}), do: {x, y + 1}
  defp advance(:east, {x, y}), do: {x + 1, y}
  defp advance(:south, {x, y}), do: {x, y - 1}
  defp advance(:west, {x, y}), do: {x - 1, y}

  defp turn_right(:north), do: :east
  defp turn_right(:east), do: :south
  defp turn_right(:south), do: :west
  defp turn_right(:west), do: :north

  defp turn_left(:north), do: :west
  defp turn_left(:east), do: :north
  defp turn_left(:south), do: :east
  defp turn_left(:west), do: :south

  @doc """
  Return the robot's direction.

  Valid directions are: `:north`, `:east`, `:south`, `:west`
  """
  @spec direction(robot) :: direction()
  def direction(%__MODULE__{direction: direction}), do: direction

  @doc """
  Return the robot's position.
  """
  @spec position(robot) :: position()
  def position(%__MODULE__{position: position}), do: position
end
