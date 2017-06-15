require_relative 'card'

class Guess

  attr_reader :answer,
              :card

  def initialize(answer, card)
    @answer = answer
  end

  def response
    @response = "Saturn"
  end

  def correct?
    @response == "Mercury"
  end

  def feedback
    if @response != "Mercury"
      puts "Incorrect."
    end
  end

end
