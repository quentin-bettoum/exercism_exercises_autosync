defmodule CircularBuffer do
  @moduledoc """
  An API to a stateful process that fills and empties a circular buffer
  """

  defstruct capacity: 0, data: []

  use GenServer

  defguardp is_full(buffer) when length(buffer.data) == buffer.capacity

  @impl GenServer
  def init(capacity) do
    {:ok, %__MODULE__{capacity: capacity, data: []}}
  end

  @impl GenServer
  def handle_call({:write, _item}, _from, %__MODULE__{} = buffer) when is_full(buffer) do
    {:reply, :full, buffer}
  end

  def handle_call({:write, item}, _from, %__MODULE__{data: data} = buffer) do
    {:reply, :ok, %__MODULE__{buffer | data: List.insert_at(data, -1, item)}}
  end

  def handle_call({:overwrite, item}, from, %__MODULE__{data: [_ | tail]} = buffer)
      when is_full(buffer) do
    handle_call({:write, item}, from, %{buffer | data: tail})
  end

  def handle_call({:overwrite, item}, from, buffer), do: handle_call({:write, item}, from, buffer)

  def handle_call(:clear, _from, buffer) do
    {:reply, :ok, %{buffer | data: []}}
  end

  def handle_call(:read, _from, %__MODULE__{data: []} = buffer), do: {:reply, :empty, buffer}

  def handle_call(:read, _from, %__MODULE__{data: data} = buffer) do
    [item | data] = data
    {:reply, item, %{buffer | data: data}}
  end

  @doc """
  Create a new buffer of a given capacity
  """
  @spec new(capacity :: integer) :: {:ok, pid}
  def new(capacity) do
    GenServer.start_link(__MODULE__, capacity)
  end

  @doc """
  Read the oldest entry in the buffer, fail if it is empty
  """
  @spec read(buffer :: pid) :: {:ok, any} | {:error, atom}
  def read(buffer) do
    case GenServer.call(buffer, :read) do
      :empty -> {:error, :empty}
      item -> {:ok, item}
    end
  end

  @doc """
  Write a new item in the buffer, fail if is full
  """
  @spec write(buffer :: pid, item :: any) :: :ok | {:error, atom}
  def write(buffer, item) do
    case GenServer.call(buffer, {:write, item}) do
      :ok -> :ok
      :full -> {:error, :full}
    end
  end

  @doc """
  Write an item in the buffer, overwrite the oldest entry if it is full
  """
  @spec overwrite(buffer :: pid, item :: any) :: :ok
  def overwrite(buffer, item), do: GenServer.call(buffer, {:overwrite, item})

  @doc """
  Clear the buffer
  """
  @spec clear(buffer :: pid) :: :ok
  def clear(buffer), do: GenServer.call(buffer, :clear)
end
