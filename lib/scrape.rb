require 'rubygems'
require 'nokogiri'
require 'open-uri'

items = Array.new
prices = Array.new

doc = Nokogiri::HTML(open("http://portland.craigslist.org/search/cto"))

items = doc.xpath("//div/p").collect {|node| node.text.strip}

prices = doc.xpath("//div[contains(@class,'product')]/p[not(@style)]/text()").collect {|node| node.text.strip}
prices.delete("")


items.each do |title|
  puts title
end
