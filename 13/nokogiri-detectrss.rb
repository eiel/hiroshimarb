require 'rubygems'
require 'open-uri'
require 'nokogiri'
require 'rss'

# url = "http://www.ruby-lang.org/ja/"
url = ARGV[0]

def detect_rss_and_output(url)
  doc = Nokogiri::HTML(open(url),nil,"utf-8")
  doc.css("link").each do |link|
    if link["type"] == "application/rss+xml" &&
        link["rel"] == "alternate"
      href = link["href"]
      url = URI.join(url,href)
      puts "detect: #{url}"
      rss_item_list(url)
    end
  end
end

# url = "http://www.ruby-lang.org/ja/feeds/news.rss"
def rss_item_list(url)
  rss = RSS::Parser.parse(url)
  rss.items.each do |item|
    puts item.pubDate.strftime("%Y/%m/%d") + ":" + item.title
  end
end

detect_rss_and_output(url)
