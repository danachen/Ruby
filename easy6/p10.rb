# Prob 10: Right Triangles

# Write a method that takes a positive integer, n, as an argument, and displays a right triangle 
# whose sides each have n stars. The hypotenuse of the triangle (the diagonal side in the 
# images below) should have one end at the lower-left of the triangle, and the other 
# end at the upper-right.

# the integer denotes the number of rows the triangle will have
# Each row will have a combo of ' ' and '*'
# row 1 will have 5-1 ' ' and 1 *
# row 2 will have 5-2 ' ' and 2 *
# row 5 will have 0 ' ' and 5 *


def triangle(row)

  row.downto(1) do |num|
    puts " "*(num-1) + '*'*(row-num+1)
  end

end



# Examples

triangle(5)

#     *
#    **
#   ***
#  ****
# *****
triangle(9)

#         *
#        **
#       ***
#      ****
#     *****
#    ******
#   *******
#  ********
# *********

