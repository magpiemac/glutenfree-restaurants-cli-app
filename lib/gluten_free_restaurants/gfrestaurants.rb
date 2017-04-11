require 'pry'

class GlutenFreeRestaurants::Restaurant

  attr_accessor :name, :location, :features, :cost, :distance

  def self.today
    self.scrape_restaurants
  end

  def self.scrape_restaurants
    restaurants = []
    restaurants << self.scrape_new
    restaurants
  end

  def self.scrape_new
    doc = Nokogiri::HTML(open("https://www.findmeglutenfree.com/search?a=Annapolis%2C%20MD&lat=38.9784&lng=-76.4922&ga=Annapolis%2C%20MD"))
    restaurant = self.new
    restaurant.name = doc.search("a.data-details-url")[0].text
    restaurant.location = doc.search("h4.data-address")[0].text
    restaurant.features = doc.search("h3")[0].text
    restaurant.cost = doc.search("span.pull-right.biz-price")[0].text
    restaurant.distance = doc.search("span.distance")[0].text
    restaurant
    #binding.pry
 end
end
