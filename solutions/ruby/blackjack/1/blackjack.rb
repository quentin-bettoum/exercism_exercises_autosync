module Blackjack
  def self.parse_card(card)
    case card
    when 'ace' then 11
    when 'ten', 'jack', 'queen', 'king' then 10
    when 'nine' then 9
    when 'eight' then 8
    when 'seven' then 7
    when 'six' then 6
    when 'five' then 5
    when 'four' then 4
    when 'three' then 3
    when 'two' then 2
    else 0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11 then 'low'
    when 12..16 then 'mid'
    when 17..20 then 'high'
    when 21 then 'blackjack'
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    range = card_range(card1, card2)
    dealer_card_value = parse_card(dealer_card)

    case
    when card1 == card2 && card1 == 'ace' then 'P'
    when range == 'blackjack' then dealer_card_value < 10 ? 'W' : 'S'
    when range == 'high' then 'S'
    when range == 'mid' then dealer_card_value >= 7 ? 'H' : 'S'
    else 'H'
    end
  end
end
