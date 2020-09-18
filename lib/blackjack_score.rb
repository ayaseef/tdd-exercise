# frozen_string_literal: true

# blackjack_score.rb

VALID_CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'jack', 'queen', 'king', 'ace'].freeze

def blackjack_score(hand)

  raise ArgumentError, 'The hand must be between 2 and 5 cards' if hand.length < 2 || hand.length > 5

  score = 0
  number_of_ace_cards = 0

  score = hand.sum do |card|

    face_card = card.to_s.downcase

    raise ArgumentError, 'Invalid Card!' unless VALID_CARDS.include? face_card

    if face_card == 'jack' || face_card == 'queen' || face_card == 'king'
      card = 10
    elsif face_card == 'ace'
      number_of_ace_cards += 1
      card = 1
    end
    card
  end

  raise ArgumentError, 'You lose! :( ' if score > 21

  while number_of_ace_cards > 0 && score <= 11
    number_of_ace_cards -= 1
    score += 10
  end

  return score
end


