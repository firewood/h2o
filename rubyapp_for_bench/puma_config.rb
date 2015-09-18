environment 'production'
preload_app!
quiet
workers 16
bind 'unix:///var/tmp/puma.sock'
