m = 3
n = 3

b=Array.new (m) {Array.new (n){0}}


for i in 0...b.length do
	b[i][0] = "x"
end

for i in 0..2 do
	b[i][1] = "pof"
end

b[0][2] = "test"

p b

#b.each_with_index do |rows,i|
#	rows.each_index do |j|
#		p b[i][i] == 
#	end
#end

# for i in 0...m do
# 	for j in 0...n do
# 		#puts "b[#{i}][#{i}] => #{b[i][i]}" 
# 		#puts "b[#{i}][#{i}] => #{b[j][i]}"
# 		puts "b[#{i}][#{i}] == b[#{j}][#{i}] => #{b[i][i] == b[j][i]}"
# 	end
# end

#Checks the columns for equality
b.each_index do |i|
  b[i].each_index do |j|
    puts "b[#{i}][#{i}] == b[#{j}][#{i}] => #{b[i][i] == b[j][i]}"
  end
end


#Checks the rows for equality
b.each do |i|
  i.all? {j == "x"}