require 'pry'

class GlutenFreeRestaurants::Restaurant

  attr_accessor :name, :location, :features, :cost, :distance

  @@all = []

  def get_page
    Nokogiri::HTML(open("https://www.findmeglutenfree.com/search?a=Annapolis%2C%20MD&lat=38.9784&lng=-76.4922&ga=Annapolis%2C%20MD"))
  end

  def scrape_new
    #binding.pry
    self.get_page.css(".search-list-item-content")
    #restaurant = self.new
    #restaurant.name = doc.search("a.data-details-url")[0].text
    #restaurant.location = doc.search("h4.data-address")[0].text
    #restaurant.features = doc.search("h3")[0].text
    #restaurant.cost = doc.search("span.pull-right.biz-price")[0].text
    #restaurant.distance = doc.search("span.distance")[0].text
    #restaurant
    #binding.pry
  end
 end

 #def scrape
   #scrape_new
 #end

 def make_restautants
   scrape_new.each do |doc|
   new_from_index_page(doc)
 end

  def self.new_from_index_page(doc)
    self.new(
    doc.search("a.data-details-url")[0].text,
    doc.search("h4.data-address")[0].text,
    doc.search("h3")[0].text,
    doc.search("span.pull-right.biz-price")[0].text,
    doc.search("span.distance")[0].text
      )
  end

  def initialize(name = nil, location = nil, features = nil, cost = nil, distance = nil)
    @name = name
    @location = location
    @features = features
    @cost = cost
    @distance = distance
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
