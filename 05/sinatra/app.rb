# -*- encoding: utf-8 -*-
$KCODE = "u"
require 'rubygems'
require 'sinatra'

# shotgunを使うと再起動しなくていいよ

helpers do
  def hoges
    ["hoge","mogu","goro"]
  end
end

before do
  @hoges = hoges()
  @hoges << "ruby"
end

get '/' do
  haml :index
end

get '/:id' do |id|
  pass unless id.to_i == 10
  @hoges << id
  haml :index
end

get '/item/*/mock/*' do
  params[:splat].join " "
end

get %r{/hello/([\d]+)} do |id|
  "Hello, #{id}"
end

not_found do
  'not foound'
end
