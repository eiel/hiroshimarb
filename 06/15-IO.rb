# -*- coding: utf-8 -*-
$KCODE = "u"

STDIN.class                     # => IO
STDOUT.class                    # => IO
STDERR.class                    # => IO

open("hoge.txt").class          # => File
File.open("hoge.txt").class     # => File

require 'open-uri'

STDOUT << "hoge\n"
open("| ls").class              # => IO
open("| ls") do |io|
  io.read                  # => "14-regexp.rb\n14-regexp.rb~\n15-IO.rb\n15-IO.rb~\nhoge.txt\nhoge.txt~\nxmptmp-in8023VRP.rb\nxmptmp-out8023ibV.rb\n"
end

`ls`
$?                              # => #<Process::Status: pid=11220,exited(0)>

# >> hoge
