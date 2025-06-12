module Port
  IDENTIFIER = :PALE

  def self.get_identifier(city)
    city.slice(0..3).upcase.to_sym
  end

  def self.get_terminal(ship_identifier)
    cargo = ship_identifier.to_s.slice(0..2)
    %w[OIL GAS].include?(cargo) ? :A : :B
  end
end
