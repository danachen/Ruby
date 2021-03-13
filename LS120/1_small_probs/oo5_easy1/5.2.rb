# 5.2: What's the Output?

class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 42       # varialbe name is assigned value 42
fluffy = Pet.new(name)    # instance objet fluffy is initialized, name 42 is passed in as argument
name += 1       # variable name is now reassigned to 42+1 = 43
fluffy2 = Pet.new(name) # a new instance object fluffy 2 is initialized, name 42 passed in
puts fluffy.name  # 42    # newly instantiated object fluffy calls its instance method name
                          # method name is initialized with 42 passed in as parameter
puts fluffy       # My name is 42.  # instance object fluffy calls method to_s when puts is called
                  # it calls the method to_s and intepolates class method #name and method upcase
                  # is called on the class method, class method has the instance varialbe name 
                  # passed to it, and converted to a string object
puts fluffy.name  # 42, since the name method returns 42 as a string object under instance object
puts fluffy.name.class # String, this is a string object as expected
puts fluffy2      # My name is 43, fluffy2 is another instance variable initialized, with value 
                  # 43 passed in
puts name         # the name variable now points to an integer value of 43