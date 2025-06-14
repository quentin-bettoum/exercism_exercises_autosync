class SimpleCalculator
  class UnsupportedOperation < StandardError
  end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise UnsupportedOperation, "Unsupported operator #{operation}" unless ALLOWED_OPERATIONS.include?(operation)
    raise ArgumentError, 'Unsupported operand type, only ints allowed' unless
      first_operand.is_a?(Integer) && second_operand.is_a?(Integer)

    result =
      case operation
      when '+' then first_operand + second_operand
      when '*' then first_operand * second_operand
      when '/'
        return 'Division by zero is not allowed.' if second_operand.zero?

        first_operand / second_operand
      end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end
