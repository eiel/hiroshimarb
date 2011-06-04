require 'rubygems'
require 'open-uri'
require 'nokogiri'

filename = "ruby.html"
doc = Nokogiri::HTML(open(filename),nil,"utf-8")
doc.css("h3").each do |h3|
  puts h3.text
end
puts doc.css("h3").size
