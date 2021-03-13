# countdown.rb

x = gets.chomp.to_i

=begin while x >= 0
  puts x
  x -= 1
end

puts "Done!"
=end

until x<0
  puts x
  x-=1
end

puts "Done!"