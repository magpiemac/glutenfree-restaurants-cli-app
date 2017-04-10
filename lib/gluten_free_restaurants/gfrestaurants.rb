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
    doc = Nokogiri::HTML(open("http://www.findmeglutenfree.com"))
    binding.pry
  end
end
