# hash
$KCODE = "u"

wday = {
  "sunday" => "日曜日",
  "monday" => "月曜日",
  "tuesday" => "火曜日",
  "wednesday" => "水曜日",
  "thursday" => "木曜日",
  "friday"  => "金曜日",
  "saturday" => "土曜日",
}
ans1 = wday
ans1                            # => {"friday"=>"金曜日", "wednesday"=>"水曜日", "tuesday"=>"火曜日", "saturday"=>"土曜日", "monday"=>"月曜日", "sunday"=>"日曜日", "thursday"=>"木曜日"}

ans2 = wday.size
ans2                            # => 7

ans1.each do |k,v|
  puts "「#{k}」は#{v}のことです。"
end

def str2hash(str)
  str.split(/\s+/)              # => ["blue", "青", "white", "白", "red", "赤"]
  Hash[*str.split(/\s+/)]
#  Hash["blue", "青", "white", "白", "red", "赤"]
end

str2hash("blue 青 white 白\nred 赤") # => {"white"=>"白", "blue"=>"青", "red"=>"赤"}

# >> 「friday」は金曜日のことです。
# >> 「wednesday」は水曜日のことです。
# >> 「tuesday」は火曜日のことです。
# >> 「saturday」は土曜日のことです。
# >> 「monday」は月曜日のことです。
# >> 「sunday」は日曜日のことです。
# >> 「thursday」は木曜日のことです。
