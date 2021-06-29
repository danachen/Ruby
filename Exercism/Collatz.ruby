class CollatzConjecture

  def self.steps(n)
    raise ArgumentError.new if n < 1 
    return 0 if n == 1
    n.even? ? self.steps(n/2)+1: self.steps(n*3+1)+1
  end
  
end