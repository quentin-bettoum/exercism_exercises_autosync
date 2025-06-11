alias DancingDots.Animation
defmodule DancingDots.Animation do
  @type dot :: DancingDots.Dot.t()
  @type opts :: keyword
  @type error :: any
  @type frame_number :: pos_integer


  @callback init(opts :: opts()) :: {:ok, opts()} | {:error, error()}

  @callback handle_frame(dot(), frame_number(), opts()) :: dot()

  defmacro __using__(_) do
    quote do
      @behaviour Animation
      def init(opts), do: {:ok, opts}
      defoverridable init: 1
    end
  end
end

defmodule DancingDots.Flicker do
  use Animation

  @impl Animation
  def handle_frame(%DancingDots.Dot{} = dot, frame_number, _opts) do
    opacity =
      case Integer.mod(frame_number, 4) do
        0 -> dot.opacity / 2
        _ -> dot.opacity
      end
    %{dot | opacity: opacity}
  end
end

defmodule DancingDots.Zoom do
  use Animation

  @impl Animation
  def init([velocity: velocity] = opts) when is_number(velocity), do: {:ok, opts}
  def init(opts) do
    value = case opts[:velocity] do
      nil -> "nil"
      any -> "\"#{any}\""
    end
    {:error, "The :velocity option is required, and its value must be a number. Got: #{value}"}
  end

  @impl Animation
  def handle_frame(%DancingDots.Dot{} = dot, 1, _), do: dot
  def handle_frame(%DancingDots.Dot{radius: radius} = dot, frame_number, [velocity: velocity] = _opts) do
    %{dot | radius: radius + (velocity * (frame_number - 1))}
  end
end
