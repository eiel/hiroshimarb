module AccessLog
  CLF_REGEXP = /
    \A (?# head)
    (\S+)\s (?# 1 address)
    (\S+)\s (?# 2 ident)
    (\S+)\s (?# 3 user)
    \[([^\]]+)\]\s (?# 4 time)
    "(\S+)\s(\S+)\s(\S+)"\s (?# 5 6 7 method url version)
    (\d+)\s (?# 8 status)
    (\d+|-)\s (?# 9 bytes)
    "([^"]*)"\s (?# 10 referer)
    "([^"]*)"\s (?# 11 user agent)
    "([^"]*)"\s (?# 12 )
    \Z (?# tail)
  /x

  Entry = Struct.new(:address, :ident, :user, :time, :method, :url,
                     :version, :status, :byte, :referer, :user_agent , :goro)

  module_function
  def each_entry(file)
    file.each_line do |line|
      if entry = parse(line)
        yield(entry)
      end
    end
  end

  def parse(line)
    if m = CLF_REGEXP.match(line)
      return Entry.new(*m.captures)
    end
    $stderr.puts("parse failture: #{line.dump}")
    nil
  end
end
