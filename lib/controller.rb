require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  get '/show' do
    erb :show
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    puts "****** 0 PB ******"
    redirect '/'
  end

  get '/gossips/:id' do
    erb :show, locals: {id: params['id']}
  end
end