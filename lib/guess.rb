require_relative 'card'

class Guess

  attr_reader :answer,
              :card

  def initialize(answer, card)
    @answer = answer
    @card = card
  end

  def response
    @response = answer
  end

  def correct?
    @response == card.answer
  end

  def feedback
    if @response != card.answer
      "Incorrect."
    else
      "Correct!"
    end
  end

end

class Deck

  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @count = cards.count
  end

end

class Round

  attr_reader :deck

  def initialize(deck)
    @deck = deck
  end

  def guesses
    @guesses = []
  end

  def current_card
    @current_card = deck.cards.first
  end

end
