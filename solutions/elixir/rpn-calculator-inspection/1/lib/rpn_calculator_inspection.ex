defmodule RPNCalculatorInspection do
  def start_reliability_check(calculator, input) do
    {:ok, pid} = Task.start_link(fn -> calculator.(input) end)
    %{input: input, pid: pid}
  end

  def await_reliability_check_result(%{pid: pid, input: input}, results) do
    status = receive do
      {:EXIT, from, :normal} when from === pid -> :ok
      {:EXIT, from, _} when from === pid -> :error
    after 100 -> :timeout end
    Map.put(results, input, status)
  end

  def reliability_check(calculator, inputs) do
    orig_value = Process.flag(:trap_exit, true)
    results = for i <- inputs, into: %{} do
        start_reliability_check(calculator, i)
        |> await_reliability_check_result(%{})
    end
    Process.flag(:trap_exit, orig_value)
    results
  end

  def correctness_check(calculator, inputs) do
    # Please implement the correctness_check/2 function
  end
end
