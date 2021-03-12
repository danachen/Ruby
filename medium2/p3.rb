# Prob 3: Lettercase Percentage Ratio

# checking the percentage of input that's lower, upper, or neither cases

LOWER = *('a'..'z')
UPPER = *('A'..'Z')

def letter_percentages(input)

  lower_count = 0
  upper_count = 0
  others = 0
  total_count = input.size

  input.each_char do |char|
    if LOWER.include?(char)
      lower_count += 1
    elsif UPPER.include?(char)
      upper_count += 1
    else
      others += 1
    end
  end

  hsh = {:lowercase => lower_count/total_count.to_f*100, :uppercase => upper_count/total_count.to_f*100,
        :neither => others/total_count.to_f*100}
end

p letter_percentages('abCdef 123') #== { lowercase: 50, uppercase: 10, neither: 40 }
letter_percentages('AbCd +Ef') #== { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') #== { lowercase: 0, uppercase: 0, neither: 100 }