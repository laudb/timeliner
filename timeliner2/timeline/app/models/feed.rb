class Feed < ActiveRecord::Base

  def feed_adder

    # to automate this process in future 

    #f  - id of a given news url goes here. "1", "2", ...
    #n  - name of a given news url. "the guardian", etc.
    #u  - url of the given news url. "http://www.***.rss"
    #c  - category of given news url. "sports", "tech", etc.

    # create a feed, passing in values
    # @feed = Feed.create(fid: f, name: n, url: u, category: c)
  end

  def fetch_articles
    require 'open-uri'
    require 'simple-rss'

    url = Feed.url

    rss = SimpleRSS.parse open(url)

    # iterate through feed. Save title, link, description
    rss.items.each do |r|

      t = r.title.force_encoding("UTF-8")
      l = r.link.force_encoding("UTF-8")
      d = r.description.force_encoding("UTF-8")

      #@article = Article.create(title: t, url: l, description: d)
    end
  end
end

