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
end
