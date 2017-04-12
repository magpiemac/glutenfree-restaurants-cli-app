require 'pry'

class GlutenFreeRestaurants::Restaurant

  attr_accessor :name, :location, :features, :cost, :distance

  def initialize(name = nil, location = nil, features = nil, cost = nil, distance = nil)
    @name = name
    @location = location
    @features = features
    @cost = cost
    @distance = distance
  end

  def self.all
    @@all ||= scrape_restaurants
  end
  
  def self.today
    self.scrape_restaurants
  end

  def self.scrape_restaurants
    restaurants = []
    restaurants << self.scrape_new
    restaurants
  end

  def self.scrape_restaurant
    doc = Nokogiri::HTML(open("https://www.findmeglutenfree.com/search?a=Annapolis%2C%20MD&lat=38.9784&lng=-76.4922&ga=Annapolis%2C%20MD"))
    doc.css(".search-list-item-content").each do |doc|
    restaurant = self.new
    restaurant.name = doc.css("a.data-details-url")[0].text
    restaurant.location = doc.css("h4.data-address")[0].text
    restaurant.features = doc.css("h3")[0].text
    restaurant.cost = doc.css("span.pull-right.biz-price")[0].text
    restaurant.distance = doc.css("span.distance")[0].text
    restaurant
    #binding.pry
  end
 end
end
