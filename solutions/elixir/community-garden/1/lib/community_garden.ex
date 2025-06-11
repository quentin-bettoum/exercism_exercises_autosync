# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> opts end)
  end

  def list_registrations(pid) do
    Agent.get(pid, & &1)
  end

  def register(pid, register_to) do
    last_plot = list_registrations(pid)
    |> Enum.sort_by(& Map.get(&1, :plot_id), :desc)
    |> List.first([plot_id: 0])

    new_plot = %Plot{plot_id: last_plot[:plot_id] + 1, registered_to: register_to}

    Agent.get_and_update(pid, & {new_plot, [new_plot | &1]} )
  end

  def release(pid, plot_id) do
    # Please implement the release/2 function
  end

  def get_registration(pid, plot_id) do
    # Please implement the get_registration/2 function
  end
end
