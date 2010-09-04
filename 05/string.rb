# Stringを作る
$KCODE = "u"

"文字列"                        # => "文字列"
w = "world"
"hello #{w}\n"                    # => "hello world\n"

"\""                            # => "\""

%Q!hello #{w}!                  # => "hello world"
%q!hoge!                        # => "hoge"

a = <<EOD                           # => "hoge\ngoro\nmogu\nworld\n"
hoge
goro
mogu
#{w}
EOD

<<'EOD'                         # => "hoge\ngoro\nmogu\n\#{w}\n"
hoge
goro
mogu
#{w}
EOD

1.times do
  <<-EOD                        # => "  hoge\n  goro\n"
  hoge
  goro
  EOD
end

sprintf "%03d", 10                # => "010"

10.to_s                         # => "10"

"逃さ".length                          # => 6
"ながさ".size                          # => 9

"ながさ".split(//u).length      # => 3

"100,200,300".split(",")        # => ["100", "200", "300"]
"100 200 300".split # => ["100", "200", "300"]

"100aabc300".unpack("a3a4a3")   # => ["100", "aabc", "300"]

"100" + "200"                   # => "100200"
"100".concat "200"              # => "100200"

"100" << "200"                  # => "100200"


"123"[2]                        # => 51
"123"[1..2]                     # => "23"

"abc" < "bc"                    # => true

a = "abc\n"
a.chomp                         # => "abc"
"abc".chomp                     # => "abc"

a  = "abc\n"
a.chop                          # => "abc"
a  = "abc".chop                 # => "ab"

"abcdef".index("cde")           # => 2
"abcdef".index("zc")            # => nil

"abcdefcde".sub("cde","hoge")      # => "abhogefcde"
"abcdefcde".gsub("cde","hoge")      # => "abhogefhoge"

"abcdef".reverse                # => "fedcba"
"abcdef".each_char do |n|
  n                             # => "a", "b", "c", "d", "e", "f"
end

"   abcdef   ".strip            # => "abcdef"
"abce".upcase                   # => "ABCE"
"ABCED".downcase                # => "abced"
"abcd".capitalize               # => "Abcd"
"abCD".swapcase                 # => "ABcd"

