# Prob 10: Get The Middle Character

def center_of(str)

  if str.length.odd?
    middle_str = str[str.length/2.to_i]
  else
    middle_str = str[str.length/2.to_i-1..str.length/2.to_i]
  end

end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'