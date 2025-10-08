module Bob
  def self.hey(string : String) : String
    string = string.strip

    return "Fine. Be that way!" if string.empty?

    is_question = string.ends_with?("?")
    is_yelled = string == string.upcase && string.chars.any?(&.letter?)
    # is_yelled = string == string.upcase && string.downcase != string

    case {is_question, is_yelled}
    when {true, true}
      "Calm down, I know what I'm doing!"
    when {true, false}
      "Sure."
    when {false, true}
      "Whoa, chill out!"
    else
      "Whatever."
    end
  end
end
