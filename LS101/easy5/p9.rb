# Prob 9: ddaaiillyy ddoouubbllee

# Write a method that takes a string argument and returns a new string that 
#contains the value of the original string with all consecutive duplicate characters 
#collapsed into a single character. You may not use String#squeeze or String#squeeze!.


# how to make sure any consecutive repeats are filtered out
# using unique will take out other useful chars as well
# 


def crunch(input)
  
  arr = input.chars
  new_arr = []
  counter = 0

  loop do 
    if arr.length <= 1
      new_arr << arr
      break
    else
      new_arr << arr[counter] if new_arr.last != arr[counter]
      counter += 1
    break if counter <= arr.length - 1
  end
  end
  new_arr.join
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba') #== '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') == 'a'
p crunch('') == ''

