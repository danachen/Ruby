1. local variable scope, especially how local variables interact with method invocations with blocks and method definitions
2. how passing an object into a method definition can or cannot permanently change the object
3. working with collections (Array, Hash, String), and popular collection methods (each, map, select, etc). Review the two lessons on these topics thoroughly.
4. variables as pointers
5. puts vs return
6. false vs nil and the idea of "truthiness"
7. method definition and method invocation
8. implicit return value of method invocations and blocks

Keys to explaining a key concept:

* the underlying principle is ...
* what this example demonstrates is ... 
* always concerned about the output, the return value, and any side effects (mutations)

There are 8 areas tested:

1. Local variable scope, how local variables interact with method invocations with blocks, and method definitions
* The difference between how local variables are accessed through method invocation with blocks, versus method definitions
* With method definition, you can’t access local variables unless they are passed in as an argument
* With method invocation with blocks, local variables declared outside of the blocks are accessible within the block, but not vice versa. The implication is that as long as the variable has been declared previously outside of the method invocation, they can be reassigned within the block, and is accessible from outside of the block.
* Otherwise, variables initialized and assigned within the block is not accessible from outside of the block.
* This also raises the interesting case where variable of the same name is initialized from within and outside of a method definition. In that case, they are referring to different variables altogether, and any reassignment will have no effect not the value.
* This is also where variable shadowing comes in, when a local variable has the same name as the parameter name of a block, and because of variable shadowing, variable within the inner scope cannot access variables of the same name outside of the block. So it could very well be that instead of seemingly reassigning an integer value to a variable, it’s actually a new assignment altogether, and the value of the local variable initialised in outer scope stays the same. 

2. Will passing an object into a method permanently change the object?
* This demonstrates whether Ruby is a language that pass by reference or value. It passes by reference of the value, which in practice means that it passes by value when the objects are immutable, and passes by reference when the objects are mutable.
* For example, strings and arrays are mutable objects, while Integers and Booleans are not
* With strings and arrays, it’s possible to mutate an object within a method if the method applied to it is destructive.  <<, setter methods, and index assignments are destructive, so are methods that end with ! (some without ending in ! are also destructive). Having a destructive method applied to an object means that the receiver is mutated, and the same object in memory has been modified. At the same time, a reassignment, for example, would not be destructive, since the variable now points to a different object in memory space altogether, and the  object outside of the method retains its original connection to the object. 
* Also note that an index assignment to an array mutates the array (still points to the same object), but the array object at that index is changed, since each array element points to its own object

3. Working with collections.
* The key words associated with each collection method is different: to iterate, to select or to transform. #map and # select is concerned with the return value of the block, and will either transform or select based on the return value of the block. The # select method will evaluate the boolean value of the block, and return an array that includes the values that are true.  #each will always return the original collection regardless of return value of block, #map will always return the same number of elements as the original collection, but transformed based on the returned value of the block. And #select will always return the same or less than the original collection, based on its boolean output of the block.
* It also matters whether the return value is a puts or not. Since a method’s return value is based on the last expression evaluated, a puts will return different values. #each does not care about return values, so it will always return the original collection, #map will return an array of nils if the last expression is puts. And #select will evaluates the puts statement, since puts always returns nil, the return value of the method will be an empty array, since nil is considered falsey. 

4. Variables as pointers
* This will deal with how variables are initialized, assigned, and re-assigned. It will also deal with variable scoping, and whether certain variables are accessible when declared in the outer or inner scope. 
* Mutating and non-mutating methods will also influence how variables point. When an object is mutated, variables are pointing to the same object, and variable assigned to another variable will also be pointing to the mutated object. Whereas if the object is instead re-assigned, variable will be disconnected from the original object and point to a new one.
* This is also reflected in muted versus non mutating methods. 
* Also note that passing an argument into a method parameter is not unlike assigning a variable to another variable, bearing in mind the variable names should be different in case variable shadowing happens. 

5. Puts vs. return
* #puts is a method applied to a variable, and the method puts always returns nil. If puts is the last expression evaluated in a method, then the method will return nil
* #return will break out of the program on the line in which it appears and the value evaluated on that line will be returned. Methods will alway return the last line evaluated so a #return is not required if it’s the last line evaluated in the method. 

6. false vs. nil and the idea of truthiness
* Truthiness is a concept in Ruby that includes any value that is not nil or falsey. It’s not true, since true and false relates to booleans, and truthy and falsey addresses values that are not booleans. 

7. method definition and method invocation
* method definitions begin with def … end, and method invocations are followed by { } or a block that begins and ends with do …end 
* those two differ in how they interact with local variables: method definitions can’t access local variables other than through parameters and interaction with blocks; method invocation on the other hand, is more flexible, and can access local variables initiated outside of the block, re-assign them within the block, although the reverse is not true. 

8. implicit return value of method invocation and blocks
* what’s returned depends on the method applied to it
* method invocation has these parts: expression whose value is the object on which the method is invoked, name of method invoked, argument values passed, and optional block of code delimited by {} or do/end pair

