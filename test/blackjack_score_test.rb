# frozen_string_literal: true

require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do
    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    # Arrange
    face_cards = ['jack', 'queen', 'king']

    # Act & Assert
    face_cards.each do |card|
      expect(blackjack_score([5, card])).must_equal 15, " used face_card #{card}"
    end
  end

  it 'calculates aces as 11 where it does not go over 21' do
    # Arrange
    hand = [2, 'ace']

    # Act
    score = blackjack_score(hand)

    # Assert
    expect(score).must_equal 13
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    # Act
    sample_score3 = blackjack_score(%w[King Queen Ace])

    # Assert

    expect(sample_score3).must_equal 21
  end

  it 'raises an ArgumentError for invalid cards' do
    # Arrange ------>>>>> THIS TEST CHECKS!
    hand = ['joker', 0, 11]

    # Act & Assert
    hand.each do |card|
      expect {
        blackjack_score([card])
      }.must_raise ArgumentError
    end
  end

  it 'raises an ArgumentError for scores over 21' do
    # Arrange ------>>>>> THIS TEST CHECKS!
    hand = [10, 10, 10]

    # Act
    # Do something part inside the curly braces.

    # Assert
    expect { blackjack_score(hand) }.must_raise ArgumentError
  end

end
