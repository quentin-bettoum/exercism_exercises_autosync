
defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    @default_msg "stack underflow occurred"
    defexception message: @default_msg

    def exception(value) do
      case value do
        [] ->
          %StackUnderflowError{}
        _ ->
          %StackUnderflowError{message: "#{@default_msg}, context: #{value}"}
      end
    end
  end

  def divide(stack) when length(stack) < 2, do: raise StackUnderflowError, "when dividing"
  def divide([0, _]), do: raise DivisionByZeroError
  def divide([a, b]), do: b / a
end
