module Chess
  RANKS = (1..8).freeze
  FILES = ('A'..'H').freeze

  def self.valid_square?(rank, file)
    RANKS.cover?(Integer(rank)) && FILES.cover?(file)
  end

  def self.nick_name(first_name, last_name)
    (first_name[...2] + last_name[-2..]).upcase
  end

  def self.move_message(first_name, last_name, square)
    nickname = nick_name(first_name, last_name)
    if valid_square?(square[1], square[0])
      "#{nickname} moved to #{square}"
    else
      "#{nickname} attempted to move to #{square}, but that is not a valid square"
    end
  end
end
