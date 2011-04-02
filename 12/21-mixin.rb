module MixinTest
  module Goro
    def hoge
      "hogehoge"
    end

    def goro
      "gorogoro"
    end
  end
end

module MixinTest2
  def hoge2
    "hoge*2"
  end

  def goro
    "goro*2"
  end
end

class Array
  include MixinTest2
  include MixinTest::Goro
end

class Integer
  include MixinTest::Goro
end

# ArrayでもIntegerでも使える
[0].hoge                        # => "hogehoge"
[1,2,3].goro                    # => "gorogoro"
[1].hoge2                       # => "hoge*2"
1.hoge                          # => "hogehoge"
2.goro                          # => "gorogoro"

class MixinEnum
  include Enumerable
  def each
    ["hoge","goro","mogu"].each do |n|
      yield n
    end
  end
end

# inculde Enumerable するだけで勝手にメソッド使用可能になる
MixinEnum.new.map(&:to_s)       # => ["hoge", "goro", "mogu"]
MixinEnum.new.max               # => "mogu"
