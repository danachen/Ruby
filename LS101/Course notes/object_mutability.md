Would passing an object into a method definition permanently change the object?

1. Object mutability is touched on when one discusses whether Ruby is a language that passes by value versus passes by reference. The outcomes really depends on the object itself. If the object is not a mutable object, then it passes by reference. If it is a mutable object, and a mutating method is applied against it, then it can appear as though it passes by value, where the caller object gets mutated in the process.

Ex 1: pass by reference
def increment(a)
  a = a+1
end
  b = 3
puts increment(b)        # 4
puts b                   # 3

Ex 2: pass by reference value(?)
def append(s)
  s << ‘*'
end
t = ‘abc’
puts append(t)        # abc*
puts t                # abc*, when s is modified by append, it modifies the same object referenced by t, t refers to the                           # original modified string object

2. Some general statements on object and method mutability:  most methods do not mutate arguments (very rare) or receiver (sometimes). Methods operating on numbers and booleans are guaranteed non-mutating.
3. An interesting example of whether the caller object is changed, based on whether it’s been reassigned or mutated first within a method definition. 

Ex 3: mutating method definition
def fix(value)
  value.upcase! #upcase! is a mutating method, and at this point, s, the caller argument, gets mutated too
  value.concat(‘!’) # and then ! is appended to the mutated object
  value
end
s = ‘hello’     #HELLO! s remains the same object, but is now mutated
t = fix(s)      #HELLO!

Ex 4: non-mutating method definition
def fix(value)
  value = value.upcase #upcase is not a mutating method, value now points to a different object
  value.concat(‘!’) # and then ! is appended to a different, the new object
  value
end
s = ‘hello’     #hello  caller object is not mutated, string referenced by s has not been modified
t = fix(s)      #HELLO!

* In this case, value = value.upcase bound the return value of value.upcase to value, and value now references a different object than before
* so #upcase does not modify the String object referenced by value. Instead, it creates a new copy of String referenced by value, modifies the copy, and returns the reference to copy. 
