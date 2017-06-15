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
