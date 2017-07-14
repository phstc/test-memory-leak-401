#!/usr/bin/env ruby

require 'shoryuken'
require './test.rb'

times = (ARGV[0] || 100).to_i
count = (ARGV[1] || 0).to_s

times.times { Test.perform_async(count) }
