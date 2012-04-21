#!/usr/bin/env ruby

require 'bundler'
Bundler.setup


require 'fuse'

include Fuse

start ARGV do
  getattr do |path, buf|
    puts "getattr #{path}"
  end
end

