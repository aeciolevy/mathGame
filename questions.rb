class Questions


  def initialize
    @num1 = 0
    @num2 = 0
  end

  def sum_question
    number = Random.new
    number.seed
    rand1_num =  number.rand(1..9)
    rand2_num = number.rand(1..9)
    @num1 = rand1_num
    @num2 = rand2_num
    "What does #{rand1_num} plus #{rand2_num} equal?"
  end

  def answer
    total = @num1 + @num2
  end


end


