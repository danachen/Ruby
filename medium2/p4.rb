# Prob 4: Matching Parentheses?

# making sure the number of parenthesis are balanced in a partiuclar input
# must have the same number of open and closes, and cannot have a negative at any point

def balanced?(input)

  open_paren = 0
  close_paren = 0

  input.each_char do |char|
    if char == '('
      open_paren += 1
    elsif char == ')'
      close_paren -=1
    else
      return false if open_paren + close_paren < 0
    end
  end

    if open_paren + close_paren != 0
      false
    else
      true
    end
end


# Official solution

def balanced?(string)
  parens = 0
  string.each_char do |char|
    parens += 1 if char == '('
    parens -= 1 if char == ')'
    break if parens < 0
  end

  parens.zero?
end


p balanced?('What (is) this?') #== true
p balanced?('What is) this?') #== false
p balanced?('What (is this?') #== false
p balanced?('((What) (is this))?') #== true
p balanced?('((What)) (is this))?') #== false
p balanced?('Hey!') #== true
p balanced?(')Hey!(') #== false
p balanced?('What ((is))) up(') #== false