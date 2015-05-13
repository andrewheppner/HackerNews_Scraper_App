require './post'
require './comment'


post = Post.new.run
puts "Title: #{post.title}"
puts "Total points: #{post.points}"
puts "URL : #{post.url}"
puts "Post ID: #{post.item_id}"
puts "This post has #{post.parsed_comments.length} comments!"
