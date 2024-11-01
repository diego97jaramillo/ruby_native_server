num = 1
sum = 5 + 51
multiply = 2 * 3
substract = 6 - 7
string = "hola"


puts string
print "#{sum}\n"
print "#{multiply}\n"
print "#{substract}\n"


if sum < 10
  print "Es menor que 10"
elsif sum == 10
  print "Es igual a 10"
else
  print "Es mayor que 10"
end


5.times do |i|
  puts "times loop"
  puts "Hay #{i} personas gay"
end

5.upto(10) { |num| puts "#{num} " }     #=> 5 6 7 8 9 10

10.downto(5) { |num| puts "#{num} " }    #=> 10 9 8 7 6 5


i = 0
until i >= 5 do
  puts "until loop"
  puts "i is #{i}"
  i += 1
end


i = 0
loop do
  puts "loop do"
  puts "i is #{i}"
  i += 1
  break if i == 5
end


print num.class

