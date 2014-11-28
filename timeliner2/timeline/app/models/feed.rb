class Feed < ActiveRecord::Base
  has_many :Article

  def feed_adder

    # to automate this process in future 

    # f  - id of a given news url goes here. e.g. "1", "2", ...
    # n  - name of a given news url. e.g. "the guardian", etc.
    # u  - url of the given news url. e.g. "http://www.***.rss"
    # c  - category of given news url. e.g. "sports", "tech", etc.

    # create a database, passing in values
    # Feed.create(fid: f, name: n, url: u, category: c)
  end


  def self.fetch_articles
    require 'open-uri'
    require 'simple-rss'

    # takes url from a Feed object after taking in fid: and assigns it to url
    
    url = Feed.find_by_fid(1).url

    # opens url and assign to rss object
    rss = SimpleRSS.parse open(url)

    # iterate through rss items, gathering title, link, description
    rss.items.each do |r|

      t = r.title.force_encoding("UTF-8")
      l = r.link.force_encoding("UTF-8")
      d = r.description.force_encoding("UTF-8")

     # binding.pry
     # Create database entry parsing in the following params
     Article.create(title: t, url: l, description: d)
     #:Article.create(title: t, url: l, description: d)
   end
 end

end

