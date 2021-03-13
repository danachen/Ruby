# Method to Proc
# solved it without using the proper syntax provided

# def convert_to_base_8(n)
#   n.method_name.method_name # replace these two method calls
# end

# # The correct type of argument must be used below
# base8_proc = method(argument).to_proc

# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# [8, 10, 12, 14, 16, 33].map(&a_proc)

#[10, 12, 14, 16, 20, 41]
# def conversion(num)
#   remainder_array = []
#   loop do 
#     remainder_array << num % 8
#     num = num / 8
#     break if num <= 0
#   end
#   remainder_array.reverse.join.to_i
# end

# def convert_to_base_8(arr)
#   new_arr = []
#   arr.map do |num|
#     new_arr << conversion(num)
#   end
#   new_arr
# end

# arr = [8, 10, 12, 14, 16, 33]
# p convert_to_base_8(arr)

# Official solution
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Either
base8_proc = method(:convert_to_base_8).to_proc
# the method convert_to_base_8 is now a symbol, then turned into a proc
# #method is associated with a particular object
# may be used to invoke method within object, and as block associated with an iterator
# end result: turned a private method into a Proc object called base8_proc

p [8, 10, 12, 14, 16, 33].map(&base8_proc) # => [10, 12, 14, 16, 20, 41]
# now the Proc object is turned into a block through &, and passed into the #map function

or 
p [8, 10, 12, 14, 16, 33].map(&method(:convert_to_base_8)) # => [10, 12, 14, 16, 20, 41]
# in this case, the convert_to_base_8 when prepended by a symbol and becomes invoked by 
# the method method, is able to get converted into a Proc object, which is then turned into
# a block

# also note this example which came with the method #method, which also introduces #call/#collect
# the idea is exactly the same, where a new object is assigned a Proc object, through 
# the method #method turning the symbol version of the class into a Proc object, then 
# is converted and passed in as a block through the &

class Thing 
  def square(n) 
    n*n 
  end 
end 

thing = Thing.new 
meth = thing.method(:square) 
meth.call(9)                                   #=> 81 
[1, 2, 3].map(&meth)               #=> [1, 4, 9]

# note how #call is used almost exclusively around Proc and lambdas
# call is used to take a method object and pass it and be called in other objects
# it's considered a common interface method name for small single method objects
# https://blog.eq8.eu/article/ruby-call-method.html
