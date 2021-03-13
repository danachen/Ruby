# my_file = File.open('tmp.txt', 'r')
# my_file.write('Additionally .... ')
# my_file.close

File.open('tmp.txt', 'a') {|file| file.write(" ... Another line\n")}

File.open('tmp.txt', 'r') do |file| 
  file.each_line do |line|
    puts line
  end
end