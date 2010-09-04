# hash

h = { :home => "/home/hoge", :user => "hoge" } # => {:user=>"hoge", :home=>"/home/hoge"}
h[:user]                                       # => "hoge"
h[:str]                                        # => nil
h.fetch(:str,"hash")                           # => "hash"
h.fetch(:home,"hash")                          # => "/home/hoge"

h = Hash.new("")
h[:str]                                        # => ""
h[:home]  =  "/home/hoge"                      # => "/home/hoge"
h[:home]                                       # => "/home/hoge"
h[:user]                                       # => ""

h  = Hash.new do |hash,key|
  hash[key]  = key.to_s.upcase
end
h[:user]                        # => "USER"
h[:home]                        # => "HOME"

h = { :home => "/home/hoge", :user => "hoge" } 
h.key? :user                     # => true
h.key? :str                      # => false
h.include? :user                 # => true
h.has_key? :str                  # => false
h.member? :user                  # => true

h.size                           # => 2
h.length                         # => 2

h.delete :home                  # => "/home/hoge"
h                               # => {:user=>"hoge"}
h = { :home => "/home/hoge", :hoge => "hoge",:user => "hoge" } 
h.delete_if do |key, vaue|
  key == :home or key == :hoge 
end
h                               # => {:user=>"hoge"}
h.clear                         # => {}

require 'active_support'

h = { :home => "/home/hoge", :hoge => "hoge",:user => "hoge" } 
h.filter :home,:hoge
h                               # => 
# ~> -:40:in `require': no such file to load -- activesupport (LoadError)
# ~> 	from -:40
