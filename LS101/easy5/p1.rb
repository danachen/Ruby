# Prob one: ASCII String Value

# Write a method that determines and returns the ASCII string value of a string 
# that is passed in as an argument. The ASCII string value is the sum of the ASCII 
# values of every character in the string. (You may use String#ord to determine the 
# ASCII value of a character.)

# can use .ord method, #map, and the reduce method to sum up value

def ascii_value(str)

  str_arr = str.chars

  return 0 if str == ''
  str_arr.map {|char| char.ord}.reduce(:+)

end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0


