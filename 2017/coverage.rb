require 'coverage'
require 'pp'

Coverage.start(branches: true)
load 'day_seven.rb' 
p Coverage.result