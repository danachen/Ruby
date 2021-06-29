class HighScores
  attr_reader :score_history

  def initialize(score_history)
    @score_history = score_history
  end

  def scores
    score_history
  end

  def latest
    score_history.last
  end

  def personal_best
    score_history.max
  end

  def personal_top
    score_history.max(3)
  end

  def report
    if latest >= personal_best
      "Your latest score was #{latest}. That's your personal best!"
    else
      "Your latest score was #{latest}. That's #{personal_best - latest} short of your personal best!"
    end
  end
end