# Use the Plot struct as it is provided

defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]

  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start() do
    Agent.start_link(fn -> %{plots: [], index: 0} end)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn %{plots: plots} -> plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, index: index} ->
      index = index + 1

      plot = %Plot{plot_id: index, registered_to: register_to}

      {plot, %{plots: [plot | plots], index: index}}
    end)
  end

  def release(pid, plot_id) do
    Agent.cast(pid, fn %{plots: plots} = status ->
      plots =
        Enum.filter(plots, fn
          %{plot_id: ^plot_id} -> false
          _ -> true
        end)

      %{status | plots: plots}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn %{plots: plots} ->
      Enum.find(
        plots,
        {:not_found, "plot is unregistered"},
        fn
          %{plot_id: ^plot_id} -> true
          _ -> false
        end
      )
    end)
  end
end
