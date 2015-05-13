require './post'
require './comment'
require 'colorize'


post = Post.new.run
puts "Title: #{post.title}".colorize(:blue)
puts "Total points: #{post.points}".colorize(:white)
puts "URL : #{post.url}".colorize(:red)
puts "Post ID: #{post.item_id}".colorize(:white)
puts "This post has #{post.parsed_comments.length} comments!".colorize(:blue)
