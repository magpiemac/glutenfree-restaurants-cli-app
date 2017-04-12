#Our CLI Controller

class GlutenFreeRestaurants::CLI

  def call
    list_restaurants
    restaurant_info
  end

  def list_restaurants
    puts "Welcome to Gluten Free Restaurants in Annapolis, MD:"
    @restaurants = GlutenFreeRestaurants::Restaurant.today
    @restaurants.each.with_index(1) do |restaurant, i|
      puts "#{i}. #{restaurant.name}"
    end
  end

  def restaurant_info
    input = nil
    while input != "exit"
      puts "Enter the number of the restaurant that you would like more information on or type list or exit:"
      input = gets.strip.downcase
      if input.to_i > 0
        the_restaurant = @restaurants[input.to_i-1]
        puts "#{the_restaurant.name} #{the_restaurant.location}\n#{the_restaurant.distance}\n#{the_restaurant.features}\n#{the_restaurant.cost}\n"
      elsif input == "list"
        list_restaurants
      elsif input == "exit"
        goodbye
      else puts "Invalid entry. Please type in list or exit."
      end
    end
  end

  def goodbye
    puts "Thank you. Come back soon."
  end
end
