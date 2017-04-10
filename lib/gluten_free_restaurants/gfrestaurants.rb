class GlutenFreeRestaurants::Restaurants

  def self.today
    #Should return instances of the restuarants
    puts "1. Giant Foods"
    puts "2. Jerry's Subs and Pizza"

    rest_1 = self.new
    rest_1.name = "Vida Taco Bar"
    rest_1.location = "200 Main Street, Annapolis, MD 21401"
    rest_1.rating = "4 stars"
    rest_1.features = "Celiac Friendly, Tacos, Restaurant"

    rest_2 = self.new
    rest_2.name = "Annapolis Ice Cream Company"
    rest_2.location = "196 Main St, Annapolis, MD 21401"
    rest_2.rating = "4 stars"
    rest_2.features = "Dessert, Allergen List, Ice Cream"
  end

end
