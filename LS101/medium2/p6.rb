# Prob 6: Tri-Angles

# A triangle is classified as follows:

# right One angle of the triangle is a right angle (90 degrees)
# acute All 3 angles of the triangle are less than 90 degrees
# obtuse One angle is greater than 90 degrees.
# To be a valid triangle, the sum of the angles must be exactly 180 degrees, 
# and all angles must be greater than 0: if either of these conditions is not satisfied, 
# the triangle is invalid.

def triangle(a1, a2, a3)

  tri = [a1, a2, a3]

  case 

  when tri.map.reduce(:+) != 180 || tri.all? {|side| side > 0} == false
    :invalid
  when 
    tri.any? {|side| side == 90}
    :right
  when 
    tri.all? {|side| side < 90} 
    :acute
  else
    :obtuse
  end

end


p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse

p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid