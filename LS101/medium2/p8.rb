# Prob 8: Next Featured Number Higher than a Given Value

# A featured number has three features:
# 1. is an odd number 
# 2. is a multiple of 7
# 3. whose digits occur exactly once each. 
# Given a number, return next featured number greater than argument
# if none available, issue error message

# the question is how to know where to start, which range to pick?
# when given 12, need the next multiple of 7, so (12/7+1)*7
# is this a featured number? if so, stop looking, if not, keep calculating


def is_featured?(num)
  num.odd? && num % 7 ==0 && num.to_s.chars.uniq.size == num.to_s.chars.size
end

# p is_featured?(1004)

def featured(n)

  if n >= 9_999_999_999
    puts 'no solution'
    else
      featured_test = (n/7+1)*7

      loop do 
        if is_featured?(featured_test) 
          return featured_test
        else
          featured_test += 7
        end   
      end

  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043

p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
