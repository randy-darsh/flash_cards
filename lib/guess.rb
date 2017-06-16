class Guess

  attr_reader :response,
              :card,
              :feedback

  def initialize(response, card)
    @response = response
    @card = card
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
