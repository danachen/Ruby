# Prob 2: What Century is That?
# Given year, must return the century
# Mapping years into the century: anything that ends with 1, 2, 3 are st, nd, rd, rest are th
# Every century divides by 100, and then if % > 0, then century is the result of the divisor +1
# E.g. 2000/100 = 20, % is 0, so it's the 20th century; 2001/100 = 20, % is 1, so it's the 
# 20+1st century
# E.g. 1965/100 = 19, % is > 0, so it's the 19+1=20th century
# E.g. 256 / 100 = 2, % is > 0, so it's the 2+1=3st century
# E.g. 5 / 100 = 0, % is > 0, so it's the 0+1=1st century
# E.g. 10103 / 100 = 101, % is > 0, so it's the 101+1=102nd century
# E.g. 1052 / 100 = 10, % is > 0, so it's the 10+1=11th century
# E.g. 1127 / 100 = 11, % is >0, so it's the 12th century
# E.g. 11201 / 100 = 112, % is > 0, so it's the 113rd century

# Now the suffix:
# 1: st, 2: nd, 3: rd, 4: th..... 20: th, 21: st, 22: nd, 23: rd, 24: th ....... 30: th, 31: st

def century(year)

  if year % 100 > 0
    cent = year / 100 + 1
  else
    cent = year / 100
  end

  if cent.to_s[-1] == '1' && cent.to_s[-2, -1] != '11'
    cent = cent.to_s + 'st'
  elsif 
    cent.to_s[-1] == '2' && cent.to_s[-2, -1] != '12'
    cent = cent.to_s + 'nd'
  elsif 
    cent.to_s[-1] == '3' && cent.to_s[-2, -1] != '13'
    cent = cent.to_s + 'rd'
  else
    cent = cent.to_s + 'th'
  end

end


p century(2000) #== '20th'
p century(2001) #== '21st'
p century(1965) #== '20th'
p century(256) #== '3rd'
p century(5) #== '1st'
p century(10103) #== '102nd'
p century(1052) #== '11th'
p century(1127) #== '12th'
p century(11201) #== '113th'


# might want to look at how cases are constructed again

case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
end