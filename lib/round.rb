class Round

  attr_reader :deck,
              :guesses,
              :feedback,
              :number_correct

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 1
  end

  def current_card
    @current_card = deck.cards.first
  end

  def record_guess(answer)
    @attempt = Guess.new(answer, current_card)
    guesses << @attempt
    return @attempt
  end

end
