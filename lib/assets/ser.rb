require 'net/http'
require 'json'
require 'uri'
uri = URI.parse('http://127.0.0.1:5000/')
#第2引数にHashを指定することでPOSTする際のデータを指定出来る
res = Net::HTTP.post_form(uri, { "q"=>'ruby'})
#puts res.code
puts res.body