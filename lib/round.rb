class Round

  attr_reader :deck,
              :guesses,
              :feedback

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def current_card
    @current_card = deck.cards.first
  end

  def record_guess(answer)
    @guesses << answer
  end

end
