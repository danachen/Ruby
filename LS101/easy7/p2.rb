# Prob 2: Lettercase Counter

UPPERCASES = ('/[A-Z]/')
LOWERCASES = ('/[a-z]/')


def letter_case_count(input)

hsh = {:lowercase => 0,
        :uppercase => 0, 
        :neither => 0}

input_arr = input.chars

input_arr.each do |char|
  if UPPERCASES.include?(char)
      hsh[:uppercase] += 1
    elsif LOWERCASES.include?(char)
      hsh[:lowercase] += 1
    else 
      hsh[:neither] += 1
  end
end

# input_arr.each do |char|
#   if ('ABCDEFG').include?(char)
#       hsh[:uppercase] += 1
#     elsif ('abcdefg').include?(char)
#       hsh[:lowercase] += 1
#     else 
#       hsh[:neither] += 1
#   end
# end

  hsh
end 

# letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') #== { lowercase: 3, uppercase: 3, neither: 2 }
# letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }