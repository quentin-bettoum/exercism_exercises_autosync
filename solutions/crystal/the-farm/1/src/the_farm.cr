class InvalidCowsError < Exception
  def initialize(nbr : Int32)
    description = nbr < 0 ? "there are no negative cows" : "no cows don't need food"
    @message = "#{nbr} cows are invalid: #{description}"
  end
end

module TheFarm
  extend self

  def divide_food(food : FodderCalculator, number_of_cows : Int32)
    begin
      food.fodder_amount! / number_of_cows * food.fattening_factor!
    rescue
      0
    end
  end

  def validate_input_and_divide_food(food : FodderCalculator, number_of_cows : Int32)
    raise "Number of cows must be greater than 0" if number_of_cows < 1

    divide_food(food, number_of_cows)
  end

  def validate_number_of_cows(number_of_cows : Int32)
    raise InvalidCowsError.new(number_of_cows) if number_of_cows < 1
  end
end
