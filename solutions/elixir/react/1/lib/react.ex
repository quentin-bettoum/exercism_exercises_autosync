defmodule React do
  use Agent

  @opaque cells :: pid

  @type cell :: {:input, String.t(), any} | {:output, String.t(), [String.t()], fun()}

  @doc """
  Start a reactive system
  """
  @spec new(cells :: [cell]) :: {:ok, pid}
  def new(cells) do
    # Agent.start_link(fn -> cells end)
    Agent.start_link(fn ->
      Enum.into(cells, %{}, fn
        {type, key, value} -> {key, {type, value}}
        {type, key, args, fun} -> {key, {type, [{fun, args}]}}
      end)
    end)
  end

  @doc """
  Return the value of an input or output cell
  """
  @spec get_value(agent :: pid, cell_name :: String.t()) :: any()
  def get_value(agent, cell_name) do
    # Agent.get(cells, &Enum.find_value(&1, fn {_, name, val} -> cell_name == name && val end))
    Agent.get(agent, fn cells -> get_cell_value(cells, cell_name) end)
  end

  defp get_cell_value(cells, cell_name) do
    case Map.get(cells, cell_name) do
      {:input, value} ->
        value

      {:output, callbacks} ->
        call_callbacks(cells, callbacks)
    end
  end

  defp call_callbacks(cells, callbacks) do
    callbacks
    |> Enum.map(fn {fun, args} ->
      args
      |> Enum.map(fn cell_name -> get_cell_value(cells, cell_name) end)
      |> then(&apply(fun, &1))
    end)
    |> List.first()
  end

  @doc """
  Set the value of an input cell
  """
  @spec set_value(agent :: pid, cell_name :: String.t(), value :: any) :: :ok
  def set_value(agent, cell_name, value) do
    Agent.update(agent, fn cells ->
      Map.update!(cells, cell_name, fn {type, _} -> {type, value} end)
    end)
  end

  defp call_outputs_callbacks_related_to_input(cells, input_name) do
    cells
    |> Enum.filter(fn
      {:input, _} -> false
      {:output, callbacks} -> call_callbacks(cells, callbacks)
    end)
  end

  @doc """
  Add a callback to an output cell
  """
  @spec add_callback(
          agent :: pid,
          cell_name :: String.t(),
          callback_name :: String.t(),
          callback :: fun()
        ) :: :ok
  def add_callback(agent, cell_name, callback_name, callback) do
    Agent.update(agent, fn cells ->
      Map.update!(cells, cell_name, fn {type, callbacks} ->
        {type, List.insert_at(callbacks, -1, {callback, callback_name})}
      end)
    end)
  end

  @doc """
  Remove a callback from an output cell
  """
  @spec remove_callback(cells :: pid, cell_name :: String.t(), callback_name :: String.t()) :: :ok
  def remove_callback(cells, cell_name, callback_name) do
  end
end
