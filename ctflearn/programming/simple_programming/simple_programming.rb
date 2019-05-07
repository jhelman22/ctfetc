# Simple Programming - https://ctflearn.com/problems/174
# Difficulty: Easy

# There is a text file with lines of binary numbers.
# We need to count the number of lines where the number of 0s is a multiple of 3
# or the number of 1s is a multiple of 2

lines = File.new(__dir__ + "/data.dat").readlines

count = 0

lines.each do |line|
  bits = line.chars
  count +=1 if bits.select{|b| b=="0"}.count % 3 == 0 || bits.select{|b| b=="1"}.count % 2 == 0
end

puts count

# Answer/Flag: 6662
