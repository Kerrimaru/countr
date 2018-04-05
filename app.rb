require 'rubygems'
require 'bundler'
Bundler.require(:default)
require './models'
require 'json'

get '/' do
  @counters = Counter.all
  erb :index
end

get '/counters/:id' do
  @counter = Counter.find(params[:id])
  erb :show
end

put '/counters/:id' do
  @counter = Counter.find(params[:id])
  content_type :json
  input_json = JSON.parse(request.body.read)
  @counter.update_attributes(input_json["counter"])
  JSON.generate(@counter.as_json)
end