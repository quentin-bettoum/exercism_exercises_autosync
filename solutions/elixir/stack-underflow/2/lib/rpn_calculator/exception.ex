
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

  def divide(stack) do
    case stack do
      x when length(x) < 2 -> raise StackUnderflowError, "when dividing"
      [0, _] -> raise DivisionByZeroError
      [a, b] -> b/a
    end
  end
end
