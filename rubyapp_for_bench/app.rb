require 'sinatra/base'
require 'redis'

class App < Sinatra::Base
  helpers do
    def redis
      Thread.current[:redis] ||= Redis.new(:driver => :hiredis)
    end
  end

  get '/hello/:f/:l' do
    "Hello #{params[:f]} #{params[:l]}!\n"
  end

  get '/incr' do
    redis.incr('hoge').to_s
  end
end
