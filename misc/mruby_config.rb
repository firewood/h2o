MRuby::Build.new do |conf|
  # load specific toolchain settings

  # Gets set by the VS command prompts.
  if ENV['MRUBY_TOOLCHAIN']
    toolchain ENV['MRUBY_TOOLCHAIN']
  elsif ENV['VisualStudioVersion'] || ENV['VSINSTALLDIR']
    toolchain :visualcpp
  else
    toolchain :gcc
  end

  # enable_debug

  # use mrbgems
  Dir.glob("../mruby-*/mrbgem.rake") do |x|
    g = File.basename File.dirname x
    if g == 'mruby-onig-regexp'
      conf.gem "../deps/#{g}" do |c|
        c.bundle_onigmo
      end
    else
      conf.gem "../deps/#{g}"
    end
  end

  # include all the core GEMs
  conf.gembox 'full-core'
  conf.gem github: 'matsumoto-r/mruby-redis'
  conf.gem github: 'rail44/mruby-rack-r3'
  conf.gem github: 'zzak/mruby-uri'
  conf.gem github: 'mattn/mruby-mysql'
end
