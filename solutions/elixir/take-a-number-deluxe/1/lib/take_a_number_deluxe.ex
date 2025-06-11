defmodule TakeANumberDeluxe do
  # Client API

  @spec start_link(keyword()) :: {:ok, pid()} | {:error, atom()}
  def start_link(init_arg) do
    GenServer.start_link(__MODULE__, init_arg)
  end

  @spec report_state(pid()) :: TakeANumberDeluxe.State.t()
  def report_state(machine) do
    GenServer.call(self(), :state)
  end

  @spec queue_new_number(pid()) :: {:ok, integer()} | {:error, atom()}
  def queue_new_number(machine) do
    GenServer.call(self(), :queue)
  end

  @spec serve_next_queued_number(pid(), integer() | nil) :: {:ok, integer()} | {:error, atom()}
  def serve_next_queued_number(machine, priority_number \\ nil) do
    # Please implement the serve_next_queued_number/2 function
  end

  @spec reset_state(pid()) :: :ok
  def reset_state(machine) do
    
  end

  use GenServer

  @impl GenServer
  def init(min_number: min, max_number: max) do
    TakeANumberDeluxe.State.new(min, max)
  end

  @impl GenServer
  def handle_call(:state, from, state) do
    {:reply, from, state}
  end

  def handle_call(:queue, from, state) do
    TakeANumberDeluxe.State.queue_new_number
    {:reply, from, state}
  end
end
