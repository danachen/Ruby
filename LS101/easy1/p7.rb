# Prob 7: Stringy Strings

# putting alternating 1 and 0, always starting with a 1
# should the new int/string be an array
# have a counter, and then insert numbers into the array

def stringy(int)

counter = int
arr = []

  while counter > 0
    if !arr.empty? && counter % 2 ==0
      arr << 0
    elsif counter % 2 !=0 && arr.last != 1 || arr.empty?
      arr << 1
    else
      next
    end
     counter -= 1
  end
  arr.join()
end



puts stringy(6) #== '101010'
puts stringy(4) #== '1010'
# puts stringy(9) #== '101010101'
# puts stringy(7) #== '1010101'
# puts stringy(5) #== '10101'
# puts stringy(3) #== '101'