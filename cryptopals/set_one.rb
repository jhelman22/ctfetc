#
# Set 1 (https://cryptopals.com/sets/1)
#

# Helper functions
def solved?(chall_name, input, output)
  puts input == output ? "#{chall_name} solved!" : "#{chall_name} failed!"
end

def hex_to_bytes(input)
  [input].pack("H*").gsub("\n","")
end

def hex_to_base64(input)
  [hex_to_bytes(input)].pack("m").gsub("\n","")
end

# Challenge 1 (https://cryptopals.com/sets/1/challenges/1)
# # Convert hex to base64
chal1_a = "49276d206b696c6c696e6720796f757220627261696e206c696b65206120706f69736f6e6f7573206d757368726f6f6d"
chal1_solution = "SSdtIGtpbGxpbmcgeW91ciBicmFpbiBsaWtlIGEgcG9pc29ub3VzIG11c2hyb29t"

chal1 = hex_to_base64(chal1_a)
solved?("Challenge 1", chal1, chal1_solution)

# Challenge 2 (https://cryptopals.com/sets/1/challenges/2)
# # Fixed XOR
chal2_a = "1c0111001f010100061a024b53535009181c"
chal2_b = "686974207468652062756c6c277320657965"
chal2_solution = "746865206b696420646f6e277420706c6179"

chal2 = (chal2_a.hex ^ chal2_b.hex).to_s(16)
solved?("Challenge 2", chal2, chal2_solution)

# Challenge 3 (https://cryptopals.com/sets/1/challenges/3)
# # Single-byte XOR Cipher
# NOT SOLVED!
def brute_chal3(input)
  with_e_counts = (~!..~^).map do |char|
    k = char * input.length
    s = (input.hex ^ k.hex).to_s(16)
    puts s
    [s, s.count('e')]
  end
  with_e_counts.sort{|a,b| a[1] <=> -b[1]}[0][0]
end

chal3_a = "1b37373331363f78151b7f2b783431333d78397828372d363c78373e783a393b3736"
chal3 = brute_chal3(chal3_a)

puts chal3





