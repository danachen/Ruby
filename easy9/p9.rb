# Prob 9: Grade book


def get_grade(g1, g2, g3)

  p score = (g1+g2+g3) / 3

  case score
  when 90..100 
    then 'A'
  when 80..90 
    then 'B'
  when 70..80 
    then 'C'
  when 60..70  
    then 'D'
  else
    'F'
  end

end

puts get_grade(95, 90, 93) #== "A"
puts get_grade(50, 50, 95) #== "D"
