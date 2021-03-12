def check_for_labs?(string)
  if string=~/lab/
    puts "yes"
  else
    puts "no"
  end
end

check_for_labs?("laboratory")
check_for_labs?("experiment")
check_for_labs?("Pan\s Labyrinth")
check_for_labs?("elaborate")
check_for_labs?("polar bear")