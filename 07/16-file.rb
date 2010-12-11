# -*- coding: utf-8 -*-

=begin
File クラス 低レベル処理がおおくあまりつかわれない？

File#remane
File.rename("before.txt","after.txt")
File.rename("data.txt","backup/data.txt")
ファイルシステム や ドライブ を越える移動はできない。
=end

# コピーする
def copy(from,to)
  open(from) do |input|
    open(to,"w") do |output|
      output.write(input.read)
    end
  end
end

# fileutilsを使うと簡単
require "fileutils"

# FileUtils.cp("data","backu/data.txt")
# FileUtils.mv("data","backu/data.txt")
# FileUtirs.mkdir("goro")
# FileUtirs.mkdir_p("hoge/goro")

# ファイルの削除
# File.delete("hoge")
# File.unlink("hoge")

=begin
Dir クラス
ディレクトリの操作 -> 低レベル処理が多くあまり使われない？
=end

# 現在のディレクトリ位置を調べる
Dir.pwd                         # => "/Users/eiel/Documents/studying/hiroshimarb/07"
# Dir.chdir("/Users")        # => 0
Dir.pwd                         # => "/Users/eiel/Documents/studying/hiroshimarb/07"

dir = Dir.open("/")                   # => #<Dir:/>
while name = dir.read
  name                          # => ".", "..", ".dbfseventsd", ".DS_Store", ".file", ".fseventsd", ".hotfiles.btree", ".Spotlight-V100", ".Trashes", ".vol", "Applications", "bin", "cores", "dev", "Developer", "etc", "home", "id_rsa", "Library", "mach_kernel", "net", "Network", "opt", "private", "sbin", "System", "tmp", "Users", "usr", "var", "Volumes", "ユーザーズガイドと情報"
end

#Dir.chdir("/usr/share")
# Dir.glob("lib*")                # => ["libiodbc", "libtool"]

# Dir.mkdir(path)
# Dir.rmdir(path)

# File.ctime("/Users")           # => 2010-09-04 14:29:04 +0900
# File.chmod(0755,path)

File.exist? "/Users"           # => true
File.directory? "/Users"       # => true
File.writable? "/Users"       # => false
File.size "/Users"           # => 238

# ファイル名の操作
path = "/goro/hoge.rb"
File.basename(path)  # => "hoge.rb"
File.basename(path,".rb")  # => "hoge"
File.dirname(path)         # => "/goro"
File.extname(path)         # => ".rb"
".rb" # !> useless use of a literal in void context
File.dirname("~/hoge")     # => "~"
File.expand_path("/gore/../hoge/mogu/../")     # => "/hoge"

File.split(path)                # => ["/goro", "hoge.rb"]
File.join("hoge","goro")        # => "hoge/goro"

# ファイル操作関連のライブラリ
# find
# tempfile
# FileUtils
# Pathname

require "find"

Find.find(".") do |path| # !> shadowing outer local variable - path
  path             # => ".", "./.#16-file.rb", "./16-file.rb", "./16-file.rb~", "./xmptmp-in65423TmK.rb", "./xmptmp-out65423gwQ.rb"
end

require "tempfile"

tempfile = Tempfile.new("hoge")
tempfile                               # => #<File:/var/folders/Bz/BzpYrmcPHi01HTWPXbtDDU+++TI/-Tmp-/hoge20101204-65803-14mgbzx>
tempfile.puts("hoge")
tempfile.close
tempfile.open.read              # => "hoge\n"
# tempfileは実行後に削除される

require "pathname"

path = Pathname.new("/Users")
path                            # => #<Pathname:/Users>
path + "hoge"                   # => #<Pathname:/Users/hoge>
path.entries                    # => [#<Pathname:.>, #<Pathname:..>, #<Pathname:.localized>, #<Pathname:eiel>, #<Pathname:Guest>, #<Pathname:PortDetect.log>, #<Pathname:Shared>]
path.children                   # => [#<Pathname:/Users/.localized>, #<Pathname:/Users/eiel>, #<Pathname:/Users/Guest>, #<Pathname:/Users/PortDetect.log>, #<Pathname:/Users/Shared>]
