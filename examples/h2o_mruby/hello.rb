# paths:
#   /:
#     file.dir: examples/doc_root
#     mruby.handler-file: /path/to/hello.rb
#
host     = "127.0.0.1"
port     = 6379

$r = Redis.new host, port

class HelloApp
  def call(env)
    key = 'hoge'
    path = env['PATH_INFO']
    $r.set key, '0' unless $r.exists?(key)
    if path == '/incr'
      current = $r.incr key
    elsif path == '/decr'
      current = $r.decr key
    end

    [200,
     {
       "content-type" => "text/plain; charset=utf-8",
     },
     ["#{current}\n"]
    ]

  end
end

HelloApp.new
