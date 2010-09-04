str = "Ruby is an object oriented programming langage"
ans1 = str.split
ans1                             # => ["Ruby", "is", "an", "object", "oriented", "programming", "langage"]

ans2 = ans1.clone
ans2.sort!
ans2 # => ["Ruby", "an", "is", "langage", "object", "oriented", "programming"]

ans3 = ans1.clone
ans3 = ans3.sort_by {|s| s.downcase }
# ans3.sort! {|l,r| l.downcase <=> r.downcase }
ans3                            # => ["an", "is", "langage", "object", "oriented", "programming", "Ruby"]

ans4 = ans1.clone
ans4.map! {|n| n.capitalize }
ans4 = ans4.join " "
ans4                            # => "Ruby Is An Object Oriented Programming Langage"

ans5 = Hash.new(0)
str.each_char do |c|
  ans5[c]  = ans5[c] + 1
end
ans5.each do |k,v|
  puts "'#{k}': " + '*'* v
end

def ans6table
  {
    "一" => 1,
    "二" => 2,
    "三" => 3,
    "四" => 4,
    "五" => 5,
    "六" => 6,
    "七" => 7,
    "八" => 8,
    "九" => 9,
    "十" => 10,
    "百" => 100,
    "千" => 1000,
  }
end

def kan2num(kan)
  table = ans6table
  ret = 0
  stack = []
  kan.split(//u).map {|n|
    table[n]                    # => 7, 1000, 100, 2, 10, 3
  }.each  do |n|
    if n < 10
      stack << n
    else
      stack << n
      stack # !> useless use of a variable in void context
      ret += stack.inject(1) {|s,v| s*v}
      stack = []
    end
  end
  ret + stack[0] if stack[0]
  ret
end

kan2num("七千百二十三")         # => 7120
#kan2num("七千二十三")           # => 7020
#kan2num("千百二十三")           # => 1120
#kan2num("百二十")               # => 120

# >> ' ': ******
# >> 'l': *
# >> 'a': ****
# >> 'm': **
# >> 'b': **
# >> 'c': *
# >> 'n': ****
# >> 'y': *
# >> 'd': *
# >> 'o': ***
# >> 'p': *
# >> 'e': ****
# >> 'g': ****
# >> 'r': ***
# >> 'R': *
# >> 's': *
# >> 't': **
# >> 'i': ***
# >> 'j': *
# >> 'u': *
