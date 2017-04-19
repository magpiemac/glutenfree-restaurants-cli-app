
class GlutenFreeRestaurants::Restaurant

  attr_accessor :name, :location, :features, :cost, :distance

  @@all = []

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

  def self.find_by_cost(cost)
    @@all.select {|restaurant| cost == restaurant.cost}
  end
end
