# 1.1 Find the Class

# puts "Hello".class
# puts 5.class
# puts [1, 2, 3].class

# 1.2 Create the Class

# class Cat

# end

# 1.3 Create the Object
# class Cat

# end

# kitty = Cat.new

# 1.4 What Are You?
# class Cat
#   def initialize
#     "I'm a cat!"
#   end
# end

# kitty = Cat.new

# 1.5 Helo Sophie ***

# class Cat
#   def initialize(name)
#     @name = name
#     puts "I'm #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')

# 1.6 Hello, Sophie! (Part 2)

# class Cat
#   def initialize(name)
#     @name = name
    
#   end

#   def greet
#     puts "I'm #{@name}!"
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# 1.7 Reader ***

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "I'm #{name}!" # here, we are invoking the method instead of the instance variable
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# 1.8 Writer

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "I'm #{name}!" # here, we are invoking the method instead of the instance variable
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.name = 'Luna'
# kitty.greet

# 1.9 Accessor

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "I'm #{name}!" # here, we are invoking the method instead of the instance variable
#   end
# end

# kitty = Cat.new('Sophie')
# kitty.greet
# kitty.name = 'Luna'
# kitty.greet

# 1.10 Walk the Cat
module Walkable
  def walk
    "Let's go for a walk"
  end
end

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "I'm #{name}!" # here, we are invoking the method instead of the instance variable
  end

  include Walkable
end



kitty = Cat.new('Sophie')
p kitty.walk