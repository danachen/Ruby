Variables as Pointers

* In Ruby, everything is an object, and objects can be assigned to variables (variables as pointers)
* You can have two variables assigned to the same object
* When you reassign a variable to a different object, it points to a different object with a different object id

1. Variables are assigned to objects, they can be reassigned to other objects, at which point the original object becomes detached from the variable.

2. Numbers and Boolean values are not mutable, meaning any changes in the values of those objects will lead to a new object created, and the variables will now point to a new object.

3. Array objects, like most, are mutable, but make sure to distinguish between the mutation of the array versus the mutation of the array elements. For example, an array made up of string elements, a = [a, b, c] can be mutated through methods such as #delete, #insert, or #fill, and those will mutate the object without changing the relationship between the array variable and object.
    * On the other hand, a specific string element in the array can be mutated, and each string element has its own object id. If you change the value of the specific string element in the array, the object id for that specific string element will change (so a new object is being pointed to). This can happen without any changes to the original array object (and object id). 

4.  This is a great article that talks about the differences between pass by reference versus [pass by value](https://robertheaton.com/2014/07/22/is-ruby-pass-by-reference-or-pass-by-value/) .

This is what is meant by passing references by value - the function and caller reference the same object in memory, but accessed through different variables. This means that the same object is being stored in multiple different boxes, and the metaphor kind of breaks down.