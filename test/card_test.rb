require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/card'
require './lib/guess'

class CardTest < Minitest::Test
  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_equal "Juneau", card.answer
  end

  def test_it_can_take_a_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal card, guess.card
    assert_equal "Juneau", guess.response
    assert_equal true, guess.correct?
    assert_equal "Correct!", guess.feedback
  end

  def test_it_can_take_another_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal card, guess.card
    assert_equal "Saturn", guess.response
    assert_equal false, guess.correct?
    assert_equal "Incorrect.", guess.feedback
  end

  def test_it_can_store_cards
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
    assert_equal 3, deck.count
  end

end
