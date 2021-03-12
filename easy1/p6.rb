# Prob 6: Reverse It (Part 2)

def reverse_words(input)

  arr = input.split

  arr.map do |element|
    if element.length >= 5
      element.reverse!
    end
  end
  arr.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS