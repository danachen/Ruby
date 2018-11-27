# OO Basics: Classes and Objects 2

# 2.1: Generic Greeting (Part 1)
# Undestanding when a class method is declared, versus an instance method
# And how to refer to the class method even if an instance object is trying to access it

# class Cat
#   def self.generic_greeting
#     p "Hello! I'm a cat!"
#   end
# end

# kitty = Cat.new
# kitty.class.generic_greeting

# #or
# class Cat
#   def self.generic_greeting
#     p "Hello! I'm a cat!"
#   end
# end

# Cat.generic_greeting

# 2.2: Hello, Chloe!

# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end

# end

# kitty = Cat.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

# 2.3: Identify Yourself (Part 1)
# class Cat
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end

#   def identify
#     self
#   end

# end

# kitty = Cat.new('Sophie')
# p kitty.identify

# 2.4: Generic Greeting (Part 2)

# class Cat
#   attr_accessor :name

#   def self.generic_greeting
#     puts "Hello, I'm a cat!"
#   end

#   def personal_greeting
#     puts "Hellow, my name is #{name}!"
#   end

#   def initialize(name)
#     @name = name
#   end

#   def rename(new_name)
#     self.name = new_name
#   end

#   def identify
#     self
#   end
# end

# kitty = Cat.new('Sophie')
# Cat.generic_greeting
# kitty.personal_greeting

# 2.5: Counting Cats

# class Cat
#   @@num = 0

#   def initialize
#     @@num += 1
#   end

#   def self.total
#     @@num
#   end
# end

# kitty1 = Cat.new
# kitty2 = Cat.new
# kitty3 = Cat.new
# kitty4 = Cat.new

# p Cat.total

# 2.6 Colorful Cat

# class Cat

#   COLOR = 'purple'
#   attr_reader :name
  
#   def initialize(name)
#     @name = name
#   end

#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end 
# end

# kitty = Cat.new('Sophie')
# kitty.greet

# 2.7 Identify Yourself (Part 2) ** to_s method

# class Cat
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def to_s
#      "I'm #{name}!"
#    end
# end

# kitty = Cat.new('Sophie')
# puts kitty

# 2.8 Public Secret ***

# class Person
  
#   attr_accessor :secret
  
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

# 2.9 Private Secret

# class Person
#   attr_writer :secret

#   def share_secret
#     @secret
#   end

#   private

#   attr_reader :secret
# end

# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# p person1.share_secret

# 2.10 Protected Secret **

class Person
  attr_writer :secret


  def compare_secret(other_person)
    secret == other_person.secret
  end
  
  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

person3 = Person.new
person3.secret = 'Shh.. this is a secret!'

puts person1.compare_secret(person3)











