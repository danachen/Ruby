Key phrases in 109

A typical problem with two variables, assignment, pointing and re-assignment
* a is initialized , and object xxx with value xxx is assigned to it
* a is now referencing a string object with the value name (for example)
* b is also initialized to a, and assigned a string object that local variable a is referencing
* currently, both local variables are pointing to the same object
* a is reassigned to a different string object with value xxx, local variable a is pointing to string object with value yyy
* b remains pointed to the string object with value xxx

When describing method definition and method invocation
* On line x-x we are defining method xxx, which takes 1 parameter 
* On line x we are calling the method example and passing in string xxx as argument to it
* On line x we are initializing the local variable y and assigning it to an integer with value z
* On line x we are calling the loop method (method of Kernel class) and passing in the do..end block as an argument, so block is passed to a method call as an argument
* Calling method puts and passing in local variable str as an argument (funny enough, puts is also a method)
* Local variable is reassigned, -= is reassignment
* - is not an operator but a method that can also be written as i=i.-(1)
* Inside the code we are reassigning the local variable i to the return value of a method call Fixnum#- on a local variable i with integer 1 passed to it as an argument
* break is used break out of the loop, if value of object that local variable i is referencing is equal to 0
* calling method xxx and passing in string yyy as an argument
* Finally, the code outputs xxx 3 times and returns nil

When discussing variable scoping and whether outer scope has access to local variables, and vice versa
Local variables that are initialized in an inner scope cannot be accessed in the outer scope, but local variables initialised in the outer scope can be access in an inner scope

This is why a local variable can be reassigned within the block if it’s initialized outside of the block. But a local variable not initialized outside of a block can’t be accessed from outside of the block. 

When discussing return values with puts as the last line
We are calling the puts method inside of our method definition, and the last line of code that is executed is returned since we don’t have an explicit return inside of the method definition. The method puts is outputting values of objects, strings, integers and so on, so our method call outputs the string xxx times, but returns nil since the last line of the code in the method is evaluated returns nil. 

Variable shadowing when a variable with the same name is initialized outer scope, and the same variable is initialized inner scope

* VS happend when parameter name of the block is the same as the local variable which was initialised outside of the block
* It prevents access to variables of the same name initialled outside of the block
* Assigning integer 5 to local variable a passed in as a parameter of the do.end block, value of local variable a initialized in outer scope remains 4

For example:
```ruby
a=4

2.times do |a|
  a=5
  puts a
end
```

To remedy the situation so a can be assigned within the block. Below, a can be reassigned within the block, and made available outside of the inner scope as well.

Whenever you are not using a certain parameter that you have passed in the block as an argument, the common practice is to name it _.

```ruby
a=4

2.times do | |
  a=5
  puts a
end
```

Mutating method call versus non-mutating method call
* A mutating method call changes the value of the calling object, so the local variable is still referencing the same object
* A non-mutating method call does not change the value of the object, so the local variable is pointing to a new object

String vs. integers/symbols when it comes to variable initialization
* Three variables initialized with the same string value are all pointing to different string objects
* Integers and symbols with the same value occupy the same physical space in memory (same object), so an integer with a value of 4 will always be the same object with the same object id even if you assign it to different local variables, same with symbols

Is += operator mutating or non-mutating
* += is a reassignment operator, so a string += would point to a different string object

Talking through the iterators

`[1, 2, 3, 4].each { |num| puts num}``

* It iterates through the array object, passing each element of the array to block, runs the block - which outputs value of parameter num.
* When it finishes, it outputs the original array.
* the #each method doesn’t care about the return value of the block.

`[1, 2, 3, 4].map { |num| puts num}`

* It iterates through the array object, passing each element of the array to the block, runs the block, and takes the return value of the block and moves it into a new array.
* When it finishes every iteration, it returns the new array with elements which were passed in.
* We are calling method puts inside the block, puts always returns nil, so example would return a new array [nil, nil, nil, nil] 
* It would output the value of the original array, but return value of the method would be this array of nil

`[1, 2, 3, 4].select { |num| puts num}`

* It also iterates through the array object passing each element of the array to the block, runs the block
* Does the return value of the block evaluates to true or not, if it does, it takes element and puts it in the new array
* The return value of the above code would be an empty array, since each iteration return value of the block evaluates to false, so non of the elements of the original array would be put into the new array