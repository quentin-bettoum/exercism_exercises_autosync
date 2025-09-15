
class PasswordLock
  alias Password = (Int32 | String | Float64)

  def initialize(@password : Password); end

  def encrypt
    @password = cipher(@password)
  end

  def unlock?(input : Password) : String?
    "Unlocked" if cipher(input) == @password
  end

  private def cipher(password)
    case password
    when Int32
      (password / 2).round
    when String
      password.reverse
    else
      password * 4
    end
  end
end
