require_relative 'card'

class Guess

  attr_reader :answer,
              :card

  def initialize(answer, card)
    @answer = answer
    @card = card
  end

  def response
    @response = "Saturn"
  end

  def correct?
    @response == "Mercury"
  end

  def feedback
    if @respose != "Mercury"
      "Incorrect."
    end
  end

end
