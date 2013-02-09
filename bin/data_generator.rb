#!/usr/bin/env ruby

require 'elastic_stretcher'
require 'pp'

include ElasticStretcher

def rand_word size
  (0..size-1).map { (97 + rand(26)).chr }.join
end

def rand_words count, size
  (0..count-1).map do
    rand_word size
  end
end

thread_count = ARGV[0].to_i
loops        = ARGV[1].to_i
client       = Client.new

puts "\n"

threads = []
thread_count.times do
  threads << Thread.new do

    loops.times do |i|

      documents = []

      1000.times do |j|
        documents <<
          { index:  "elastic_stretcher_data_generator_article",
            type:   "article",
            data:   { title: rand_words(10, 5).join(" "),
                      tags:  rand_words(10, 4),
                      time:  (Time.now - rand(60*60*24*365)).strftime("%F") } }
      end

      indexer = Indexer.new client, documents
      indexer.index

      print "."
    end

  end
end

threads.each { |th| th.join }

puts "\n"

client.close

puts "\n"
