require 'prime'

n = 1000001
primes = []
while primes.count < 2 do
  primes << n if n.prime? && n.to_s.chars.inject(0){|sum,i| sum + i.to_i}.prime?
  n += 2
end

puts primes.join
