class SavingsAccount
  def self.interest_rate(balance : Float64) : Float64
    case
    when balance < 0
      3.213
    when balance < 1000
      0.5
    when balance < 5000
      1.621
    else
      2.475
    end
  end

  def self.interest(balance : Float64) : Float64
    balance / 100 * interest_rate(balance)
  end

  def self.annual_balance_update(balance : Float64) : Float64
    balance + interest(balance)
  end

  def self.years_before_desired_balance(current_balance : Float64, target_balance : Float64) : Int32
    year = 0

    until current_balance >= target_balance
      current_balance = annual_balance_update(current_balance)
      year += 1
    end

    year
  end
end
