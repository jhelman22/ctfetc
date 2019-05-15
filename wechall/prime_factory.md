# [Prime Factory](https://www.wechall.net/challenge/training/prime_factory/index.php)

> Your task is simple:
> Find the first two primes above 1 million, whose separate digit sums are also prime.
> As example take 23, which is a prime whose digit sum, 5, is also prime.
> The solution is the concatination of the two numbers,
> Example: If the first number is 1,234,567
> and the second is 8,765,432,
> your solution is 12345678765432

So we can script this... You could implement a prime finding algorithm like the 
Sieve of Erastothenes but I'll just use the ruby prime library...

```ruby
require 'prime'

n = 1000001
primes = []
while primes.count < 2 do
  primes << n if n.prime? && n.to_s.chars.inject(0){|sum,i| sum + i.to_i}.prime?
  n += 2
end

puts primes.join
```

Answer is **10000331000037**

