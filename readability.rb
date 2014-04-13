require 'rubygems'
require 'readability'
require 'open-uri'

source = open('http://www.theverge.com/us-world/2014/4/11/5606524/hacker-successfully-uses-heartbleed-to-retrieve-private-security-keys').read
puts Readability::Document.new(source).content