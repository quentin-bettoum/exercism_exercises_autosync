module Chess
  extend self
  
  RANKS = 1..8
  FILES = 'A'..'H'

  def valid_square?(rank, file)
    RANKS.includes?(rank) && FILES.includes?(file)
  end

  def nickname(first_name, last_name)
    (first_name[...2] + last_name[-2..]).upcase
  end

  def move_message(first_name, last_name, square)
    nickname = nickname(first_name, last_name)
    if valid_square?(square[1].to_i, square[0])
      "#{nickname} moved to #{square}"
    else
      "#{nickname} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
