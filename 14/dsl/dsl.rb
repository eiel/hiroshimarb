
class DSL
  def say(str)
    puts str
  end

  def shout(str)
    puts str + "!!!!!"
  end
end

Dir.glob("*.dsl.rb").each do |filename|
  file = open(filename).read
  obj = DSL.new
  puts "dsl start"
  puts "============================================================="
  obj.instance_eval file
end
