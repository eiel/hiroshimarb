# -*- coding: utf-8 -*-
var = 1 # ファイルスコープ
class Hoge
  var = 2 # クラススコープ (モジュール)
  def hoge
    var = 3 # メソッド定義
    var                         # => 3
  end
  var                           # => 2
end
var                             # => 1

Hoge.new.hoge # Hoge#hogeをよばないと 3 がでないので

if false
  a = 1
end
a                               # => nil
# ifの中は実行してないのに nil に初期化され NameError にならない

# 18.10.4 ブロック変数
n = 100
10.times do |n| # !> shadowing outer local variable - n
  n                             # => 0, 1, 2, 3, 4, 5, 6, 7, 8, 9
end
n                               # => 100
p n
# 1.8 以前だと 9になる
# >> 100
