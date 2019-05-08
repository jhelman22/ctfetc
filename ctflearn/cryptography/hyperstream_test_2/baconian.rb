alphabet = "abcdefghiklmnopqrstuwxyz"
ciphertext = "ABAAAABABAABBABBAABBAABAAAAAABAAAAAAAABAABBABABBAAAAABBABBABABBAABAABABABBAABBABBAABB"

plaintext = ciphertext.scan(/.{5}/).map do |c|
  bit_string = c.chars.map{|b| b == 'A' ? 0 : 1}.join
  alphabet[bit_string.to_i(2)]
end.join

puts plaintext.upcase

