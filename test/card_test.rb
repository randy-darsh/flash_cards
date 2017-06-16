require 'minitest'
require 'minitest/pride'
require 'minitest/autorun'
require './lib/card'
require './lib/guess'
require './lib/round'
require './lib/deck'

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

  def test_it_processes_responds_and_records_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
    assert_equal [], round.guesses
    assert_equal card_1, round.current_card
    assert_instance_of Guess, round.record_guess("Juneau")
    # # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">
    assert_equal 1, round.guesses.count
    assert_equal "Correct!", round.guesses.first.feedback
    # assert_equal 1, round.number_correct
    # assert_equal card_2. round.current_card
    # assert_equal guess, round.record_guess("2")
    # # => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
    # assert_equal 2, round.guesses.count
    # assert_equal "Incorrect.", round.guesses.last.feedback
    # assert_equal 1, round.number_correct
    # assert_equal 50, round.percent_correct
  end

end
