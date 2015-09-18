class App
  include Rack::R3

  def redis
    @redis ||= Redis.new('127.0.0.1', 6379)
  end

  get '/hello/{first_name}/{last_name}' do |f, l|
    [200,
     {'content-type' => 'text/plain; charset=utf-8'},
     ["Hello #{f} #{l}!\n"]
    ]
  end

  get '/incr' do
    [200,
     {'content-type' => 'text/plain; charset=utf-8'},
     ["#{redis.incr('hoge')}\n"]
    ]
  end
end

App.new
