
# Integer.times
4.times do
  "hoge"                        # => "hoge", "hoge", "hoge", "hoge"
end

# Range.each
sum = 0
(1..10).each do |n|
  sum += n
end
sum                             # => 55

# Array.each
kotoba = ["mogu","goro","hoge"]
kotoba.each do |n|
  n                             # => "mogu", "goro", "hoge"
end

# Hash.each
hash = {:tomorrow => "明日",
  :yesterday => "昨日",
  :today => "今日",
}
hash.each do |pair|
  "#{pair[0]}:#{pair[1]}"             # => "tomorrow:明日", "yesterday:昨日", "today:今日"
end

# File.each_line 省略

elems = ["hogehoge","goro","awawa"]
# 辞書順
elems.sort! do |l,r|
  l <=> r
end
elems                           # => ["awawa", "goro", "hogehoge"]

# 長さ順
elems.sort! do |l,r|
  l.length <=> r.length
end
elems                           # => ["goro", "awawa", "hogehoge"]

# 辞書逆順
elems.sort! do |l,r|
  r <=> l
end
elems                           # => ["hogehoge", "goro", "awawa"]

# 長さ逆順
elems.sort! do |l,r|
  r.length <=> l.length
end
elems                           # => ["hogehoge", "awawa", "goro"]

# sort_byを使うともっとシンプル
elems.sort_by! do |n|
  n
end
elems                           # => ["awawa", "goro", "hogehoge"]
elems.sort_by! do |n|
  n.length
end
elems                           # => ["goro", "awawa", "hogehoge"]

# ブロック付きメソッドをつくる
# イテレータ よくあるforをつかって実装してみる
class Array
  def my_each(&block)
    for i in (0..length-1)
      block.call(self[i])
#      yield self[i]
    end
  end
end

["hoge","goro","mogu"].my_each do |n|
  n                             # => "hoge", "goro", "mogu"
  n[0]                          # => "h", "g", "m"
end

# 前や後にきまった処理をおこないたい場合
def decorate
  if block_given?
    ret = "----"
    ret += yield
    ret += "++++"
  else
    "guruguru"
  end
end
decorate                        # => "guruguru"

n = decorate do
  "hogehoge"
end
n                               # => "----hogehoge++++"

def decorate2(&block)
  if block.nil?
    "nilnil"
  else
    ret = "+++"
    ret += block.call
    ret += "---"
  end
end
decorate2                       # => "nilnil"

n = decorate2 do
  "hogehoge"
end
n                               # => "+++hogehoge---"

# ブロックの渡し方
(1..4).each do |x|
  x + 2                         # => 3, 4, 5, 6
end

add_2 = proc {|x| x + 2}
add_2.call 4                    # => 6
(1..4).map(&add_2)             # => [3, 4, 5, 6]

# Integerのメソッドであればシンボルを渡すだけでも処理ができる(おまけ
(1..4).map(&:to_s)              # => ["1", "2", "3", "4"]

# ブロックの正体を確認してみよう Procオブジェクト
def my_method(&block)
  block.class                   # => Proc
end
my_method do "hoge" end

# add_2を単独で使用してみる
add_2[3]                        # => 5
add_2.call(3)                   # => 5
# add_2(3) <- これはできないが javascriptだとできたりする
def add_2(n)
  n + 5
end
# def add_2があるとそちらがよばれる
add_2(3)                        # => 8

def my_open(filename)
  fd = open(filename)
  yield fd
  fd.close()
end

# my_open("hoge.txt") do |io|
#   io.read                       # => 
# end

array = [0,1,2,3,4,5,6,7,8,9]
array = (0..9).to_a
array_x_10 = array.map do |y|
  y * 10
end
array_x_10                      # => [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]

def my_array(array,&block)
  ret = []
  array.each do |n|
    ret << block.call(n) # ret << n * 10
  end
  ret
end

n = my_array(array) do |y|
  y * 10
end

y_x_10 = proc do |y| y*10 end

my_array(array,&y_x_10)
n                               # => [0, 10, 20, 30, 40, 50, 60, 70, 80, 90]
