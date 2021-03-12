# Prob 6: Staggered Caps (Part 2)

# how to make the empty spaces not count in the index when iterating through
# if I break it into words, then every word starts its own index


def staggered_case(input)
  new_arr = []
  upper_case = true

  input.chars.each do |char|
    if char =~ /[a-z]/i 
      if upper_case
        new_arr << char.upcase 
      else
        new_arr << char.downcase
      end
      upper_case = !upper_case
    else
      new_arr << char
    end
  end
    new_arr.join

end

p staggered_case('I Love Launch School!') #== 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') #== 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') #== 'IgNoRe 77 ThE 444 nUmBeRs'