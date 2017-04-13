
class GlutenFreeRestaurants::Restaurant

  attr_accessor :name, :location, :features, :cost, :distance

  @@all = []

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
