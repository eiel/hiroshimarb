# -*- coding: utf-8 -*-
$KCODE = "u"

/[A-D]\d+/ # A1300,B2400 にマッチする # !> useless use of a literal in void context

/R..y/  # Ruby など Rではじまってyで終わる4文字の文字列にマッチする # !> useless use of a literal in void context


/R..y/.class                          # => Regexp
Regexp.new("R..y").class              # => Regexp
%r(R..y).class                        # => Regexp
%r!R..y!.class                        # => Regexp

/R..y/  =~ "Ruby"               # => 0
/R..y/  =~ "ruby"               # => nil
/R..y/ =~ "eRuby"               # => 1

if /R..y/  =~ "Ruby"
  "R..yにマッチしたよ"          # => "R..yにマッチしたよ"
else
  "R..yにマッチしなかったよ"    # => 
end

if /R..y/  =~ "ruby"
  "R..yにマッチしたよ"          # => 
else
  "R..yにマッチしなかったよ"    # => "R..yにマッチしなかったよ"
end

/^ABC$/  =~ "ABC"                 # => 0
/^ABC$/ =~ "ABCDEF"               # => nil
/^ABC$/ =~ "123ABC"               # => nil
/^ABC/ =~ "ABC"                   # => 0
/^ABC/ =~ "ABCDEF"                # => 0
/^ABC/ =~ "123ABC"                # => nil
/ABC$/  =~ "ABC"                 # => 0
/ABC$/ =~ "ABCDEF"               # => nil
/ABC$/ =~ "123ABC"               # => 3

/^ABC$/ =~ "ABC\nDEF"            # => 0
/^ABC\z/ =~ "ABC\nDEF"           # => nil
/DEF\z/ =~ "ABC\nDEF"           # => 4

"abc\n".gsub(/\z/,"!!!")        # => "abc\n!!!"
"abc\n".gsub(/\Z/,"!!!")        # => "abc!!!\n!!!"

# 14.2.3

/[ABC]/ =~ "A"                  # => 0
/[ABC]/ =~ "B"                  # => 0
/[ABC]/ =~ "C"                  # => 0
/[ABC]/ =~ "D"                  # => nil
/[A-Z]/ =~ "A"                  # => 0
/[A-Z]/ =~ "1"                  # => nil
/[A-Z0-9]/ =~ "1"               # => 0
/[a-zA-Z0-9]/ =~ "a"            # => 0

/[^ABC]/ =~ "A"                 # => nil
/[^ABC]/ =~ "D"                 # => 0
/[^ABC]100/ =~ "D100"           # => 0

/./ =~ "A"                      # => 0
/./ =~ "AB"                     # => 0
/./ =~ ""                       # => nil

/^...$/ =~ "ABC"                # => 0

/ABC\sDEF/ =~ "ABC DEF"         # => 0
/ABC\sDEF/ =~ "ABC\nDEF"         # => 0
/ABC\sDEF/ =~ "ABC\tDEF"         # => 0
/ABC DEF/ =~ "ABC\tDEF"         # => nil
/ABC\sDEF/ =~ "ABC\sDEF"         # => 0

/\d/ =~ "1"                     # => 0
/\d/ =~ "A"                     # => nil

/\w/ =~ "A"                     # => 0
/\w/ =~ "1"                     # => 0
/\w/ =~ " "                     # => nil

/\AABC/ =~ "ABCDEF"            # => 0
/\AABC/ =~ "0123ABCDEF"        # => nil

/\./ =~ "."                     # => 0
/\./ =~ " "                     # => nil
/\./ =~ "a"                     # => nil

/BA*C/ =~ "BC"                     # => 0
/BA*C/ =~ "BAAAAAC"                # => 0
/Core\s*Data/ =~ "Core Data"       # => 0
/C\+\++/ =~ "C+"                   # => nil
/C\+\++/ =~ "C++"                  # => 0
/C\+\++/ =~ "C+++++++"             # => 0

/CA?D/ =~ "CD"                  # => 0
/CA?D/ =~ "CAD"                 # => 0
/CA?D/ =~ "CAAD"                # => nil

"ABCDABCDABCD" =~ /A.*B/
$&                              # => "ABCDABCDAB"
"ABCDABCDABCD" =~ /A.*?B/
$&                              # => "AB"

"ABCDABCDABCD" =~ /^(ABCD)$/    # => nil
"ABCDABCDABCD" =~ /^(ABCD)*$/    # => 0

"ABC" =~ /^(ABC|DEF)$/           # => 0
"DEF" =~ /^(ABC|DEF)$/           # => 0
"A" =~ /^(ABC|DEF)$/           # => nil
"D" =~ /^(ABC|DEF)$/           # => nil

# 14.3
Regexp.new("ABC*DEF") =~ "ABC*DEF" # => nil
Regexp.new(Regexp.quote("ABC*DEF")) =~ "ABC*DEF" # => 0
Regexp.quote("ABC*DEF")                          # => "ABC\\*DEF"
Regexp.quote("ABC*******D****EF") # => "ABC\\*\\*\\*\\*\\*\\*\\*D\\*\\*\\*\\*EF"

/ABC/i =~ "abc"                 # => 0
/ABC/ =~ "abc"                  # => nil

/./ =~ "\n"                     # => nil
/./m =~ "\n"                     # => 0

/\s/ =~ "\n"                    # => 0

Regexp.new(".",Regexp::MULTILINE) =~ "\n" # => 0
Regexp.new(".") =~ "\n"                   # => nil

/(.)(.)(.)/ =~ "ABC"            # => 0
$1                              # => "A"
$2                              # => "B"
$3                              # => "C"

/<[^>*]*>(.*)<\/[^>*]*>/  =~ "aaa<a href='hoge'>bbbb</a>"
$1                              # => "bbbb"

# 14.6

"abc def\nghi".sub(/\s/,'')     # => "abcdef\nghi"
"abc def\nghi".gsub(/\s/,'')    # => "abcdefghi"

"abcdatabra".scan(/.a/) do |matched|
  matched                       # => "da", "ta", "ra"
end

"abcdatabra".scan(/.a/)         # => ["da", "ta", "ra"]
"abcdatabra".scan(/.a/).join    # => "datara"
"abcdatabra".scan(/.a/).join(" ")    # => "da ta ra"

# http://www.geocities.jp/oraclesqlpuzzle/regex/ 正規表現パズル

"ABC".match(/ABC/)              # => #<MatchData "ABC">
"AB".match(/ABC/)              # => nil

mat = "ABC".match(/(.)(.)(.)/) # => #<MatchData "ABC" 1:"A" 2:"B" 3:"C">
mat[1]                         # => "A"
mat[2]                         # => "B"
mat[3]                         # => "C"

"012ABCDEF".match(/ABC/).pre_match # => "012"
"012ABCDEF".match(/ABC/).post_match # => "DEF"

# 練習問題 14-1
# メールアドレスのローカルパートとホスト名の取得

"eiel@hoge.com" =~ /^([^@]+)@(.*)$/
$1                              # => "eiel"
$2                              # => "hoge.com"

# 練習問題 14-2
# オブジェクト指向は簡単?
str = "オブジェクト指向は難しい!なんて難しいんだ!"
str.sub(/難しい/,"簡単").sub(/難しいんだ/,"簡単なんだ")      # => "オブジェクト指向は簡単!なんて簡単なんだ!"

# 14-3
# ワードキャピタライズ
def word_capitalize(str)
  str.split(/\-/).map(&:capitalize.to_proc).join('-')
  str.split(/\-/).map(&:capitalize).join('-')
  str.split(/\-/).map do |n|
    n.capitalize
  end.join('-')
end

word_capitalize("in-reply-to")  # => "In-Reply-To"
word_capitalize("X-MAILER")  # => "X-Mailer"

