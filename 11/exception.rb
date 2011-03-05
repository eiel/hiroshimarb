def hoge()
  begin
    Dir.chdir("a")
  rescue
    p $!
    p $@
  end
end

# hoge
Dir.chdir("b")
