# Prob one: Short Long Short
# input: two strings, one long, one short
# join strings in this order short-long-short, output new string

def short_long_short(str1, str2)
  
  shorter_str = ''
  longer_str = ''
  new_str = shorter_str + longer_str + shorter_str
  

  if str1.length < str2.length
    shorter_str = str1 
    longer_str = str2
  else
    shorter_str = str2
    longer_str = str1
  end

  shorter_str + longer_str + shorter_str
end

p short_long_short('abc', 'defgh') #== "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# straightforward, not sure why the assignment on line 9 is not working though, all in all
# the assignment of a new variable does not seem necessaryw
