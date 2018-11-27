Lesson 5: Advanced Ruby Collections (Working with Blocks)

What are the questions asked when working with a block?
* What type of action is being performed? (method call, block, conditional, etc?)
* What is the object that action is being performed on?
* What’s the side effect of the action? Output vs. destructive action
* What’s the return value of the action?
* Is return value used by whatever instigated the action?

Example 1: Working with #each method

```ruby
[[1, 2], [3, 4]].each do |arr| 
    puts arr.first 
end
# 1# 3# => [[1, 2], [3, 4]]
```

What’s happening here?
* Array#each method is called on the multi-dimensional array 
* and each inner array is passed to block in turn, and assigned to local variable arr
* Array#first is called on arr, returns object at index 0 of current array, integers 1 and 3
* #puts method outputs string representation of integer
* #puts returns will, and since it’s the last evaluated statement in the block, return value of block is nil
* #each doesn’t do anything with returned value, since returned value of #each is the calling object, that’s returned

| Line      | Action                | Object                            | Side Effect                                   | Return Value                      | Is Return Value Used?                         |       |
|--------   |---------------------- |---------------------------------  |---------------------------------------------  |---------------------------------  |---------------------------------------------- |---    |
| 1         | method call (#each)   | outer array                       | none                                          | calling object                    | no, but shown on line 6                       |       |
| 1 to 3    | each sub-array        | each sub-array                    | none                                          | nil                               | no                                            |       |
| 2         | method call (#first)  | each sub-array                    | none                                          | element at index 0 of sub-array   | yes, used by puts                             |       |
| 2         | method call (#puts)   | element at index 0 of sub-array   | outputs string representation of an integer   | nil                               | yes, used to determine return value of block  |       |

