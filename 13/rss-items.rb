require 'rss'

url = "http://www.ruby-lang.org/ja/feeds/news.rss"
rss = RSS::Parser.parse(url)
rss.items.each do |item|
  puts item.pubDate.strftime("%Y/%m/%d") + ":" + item.title
end
