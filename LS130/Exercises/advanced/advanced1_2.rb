# Exploring Procs, Lambdas, and Blocks: Definition and Arity

# Group 1: Proc object
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc  # #<Proc:0x00007fe5c91c6b08@advanced1_2.rb:4>
# puts my_proc.class # Proc
# my_proc.call # This is a .
# my_proc.call('cat') # This is a cat.

# # Group 2

# Two ways to create a lambda object, one with lambda {}, second with lambda = ->(thing) {}
# note that lambda.call must have an argument passed into the method if one is expected
# whereas a proc object does not expect that to be there

# my_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_second_lambda = -> (thing) { puts "This is a #{thing}." }
# puts my_lambda
# #<Proc:0x00007faaf90223e8@advanced1_2.rb:11 (lambda)>
# puts my_second_lambda
# #<Proc:0x00007faaf90223c0@advanced1_2.rb:12 (lambda)>
# puts my_lambda.class
# # Proc
# my_lambda.call('dog')
# # This is a dog.
# my_second_lambda.call('cat')
# # This is a cat.
# ## my_lambda.call
# # wrong number of arguments
## my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }
# uninitialized constant Lambda (NameError)
# my_third_lambda = lambda { |thing| puts "This is a #{thing}." }
# my_third_lambda.call('horse')
# # Lambda.new does not work, but lambda {} does work, as long as an argument is passed in
# # or, if the argument is already passed in
# my_third_lambda = lambda { |thing = 'horse'| puts "This is a #{thing}." }
# my_third_lambda.call


# # Group 3
# def block_method_1(animal)
#   yield if block_given?
# end

# p block_method_1('seal') { |seal| puts "This is a #{seal}."}
# # This is a .
# # nil
# p block_method_1('seal')
# # no block given(yield) LocalJumpError
# # otherwise, if if block_given? is present, then returns nil

# Group 4
def block_method_2(animal)
  yield
end

block_method_2('') { puts "This is a turtle."}
block_method_2('') do |animal = ['turtle', 'seal']|
  puts "This is a #{animal[0]} and a #{animal[1]}."
end
block_method_2(''){ |animal = 'turtle'| puts "This is a #{animal}."}