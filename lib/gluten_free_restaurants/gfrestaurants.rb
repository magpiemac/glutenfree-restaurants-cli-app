require 'pry'

class GlutenFreeRestaurants::Restaurants

  attr_accessor :name, :location, :rating, :features, :url

  def self.today
    #Scrape and return restaurant_info
    self.scrape_restaurants
  end

  def self.scrape_restaurants
    restaurants = []

    restaurants << self.scrape

    #Go to website, enter location
    #extract restaurant information
    #instatniate a restaurant

    restaurants
  end

  def self.scrape
    doc = Nokogiri::HTML(open("http://www.findmeglutenfree.com/search?a=Annapolis%2C%20MD&lat=38.9784&lng=-76.4922&ga=Annapolis%2C%20MD"))
    name = doc.search("h1.li.data-name").text
    #binding.pry
  end
end
