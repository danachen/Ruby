# Prob 5: Uppercase Check

def uppercase?(input)

  input.chars.each do |char|
    if ('a'..'z').to_a.include?(char)
      return false
    else
      true
    end
  end
  true
end


p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true