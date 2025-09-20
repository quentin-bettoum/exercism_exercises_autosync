module Blackjack
  extend self

  def parse_card(card : String) : UInt8
    case card
    when "ace"                          then 11u8
    when "ten", "jack", "queen", "king" then 10u8
    when "nine"                         then 9u8
    when "eight"                        then 8u8
    when "seven"                        then 7u8
    when "six"                          then 6u8
    when "five"                         then 5u8
    when "four"                         then 4u8
    when "three"                        then 3u8
    when "two"                          then 2u8
    else                                     0u8
    end
  end

  def card_range(card1 : String, card2 : String) : (String | Nil)
    case parse_card(card1) + parse_card(card2)
    when 4..11  then "low"
    when 12..16 then "mid"
    when 17..20 then "high"
    when 21     then "blackjack"
    end
  end

  def first_turn(card1 : String, card2 : String, dealer_card : String) : String
    range = card_range(card1, card2)
    dealer_card_value = parse_card(dealer_card)

    case
    when card1 == card2 == "ace" then "P"
    when range == "blackjack"    then dealer_card_value < 10 ? "W" : "S"
    when range == "high"         then "S"
    when range == "mid"          then dealer_card_value >= 7 ? "H" : "S"
    else                              "H"
    end
  end
end
