class GlutenFreeRestaurants::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.findmeglutenfree.com/search?a=Annapolis%2C%20MD&lat=38.9784&lng=-76.4922&ga=Annapolis%2C%20MD"))
  end

  def scrape_new
    self.get_page.css(".search-list-item-content")
  end

  def make_restaurants
    scrape_new.each do |doc|
      GlutenFreeRestaurants::Restaurant.new(
      doc.search("a.data-details-url")[0].text,
      doc.search("h4.data-address")[0].text,
      doc.search("h3")[0].text,
      doc.search("span.pull-right.biz-price")[0].text,
      doc.search("span.distance")[0].text
        )
  end
 end
end
