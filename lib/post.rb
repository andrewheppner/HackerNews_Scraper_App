require 'nokogiri'

class Post

  attr_reader :title, :url, :points, :item_id

  def initialize
    @doc = Nokogiri::HTML(File.open('../post.html'))
  end

  def run
    get_title
    get_points 
    get_url
    get_id
    collect_comments
  end
  

  private

  def get_title
    @title = @doc.search('.title > a:first-of-type').map { |a| a.inner_text }
    @title[0]
  end

  def get_points
    @points = @doc.search('.title > span:first-child').map { |span| span.inner_text }
    @points[0]
  end

  def get_url
    @url = @doc.search('.title > a:first-of-type').map { |link| link['href'] }
    @url[0]
  end

  def get_id
    @item_id = @doc.search('.subtext > a:nth-of-type(2)').map { |a| a['href'] }
    @item_id[0].gsub(/item?id/, '')
  end

  def collect_comments
    @doc.search('.default').map do |comment| 
      c = Comment.new
      c.text = comment.search('.comment > font').map { |font| font.inner_text }
      c.author= comment.search('.comhead > a:first-child').map { |link| link.inner_text }
      c.date_created = comment.search('.comhead > a:nth-of-type(2)').map { |link| link.inner_text }
      store_comments(c)
    end
  end

  def store_comments(object)
    @parsed_comments = []
    @parsed_comments << object  
  end

end