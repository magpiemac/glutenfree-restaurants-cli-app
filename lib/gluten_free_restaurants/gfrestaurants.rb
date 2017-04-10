class GlutenFreeRestaurants::Restaurants

  attr_accessor :name, :location, :rating, :features, :url

  def self.today
    #Scrape and return restaurant_info
    self.scrape_restaurants
  end

  def self.scrape_restaurants
    restaurants = []
    #Go to website, enter location
    #extract restaurant information
    #instatniate a restaurant

    [restaurants]
  end

end
