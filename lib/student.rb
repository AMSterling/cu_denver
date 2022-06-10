class Student
  attr_reader :name, :age, :scores

  def initialize(info)
    @name = info[:name]
    @age = info[:age]
    @scores = []
  end

  def log_score(score)
    @scores << score
  end

  def grade
    # scores.inject{ |sum, score| sum + score }.to_f / scores.length
    scores.reduce(:+).to_f / scores.count
  end

end
