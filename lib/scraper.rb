require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)

    doc.css(".roster-cards-container .student-card").each do |profile|
    student ={}
    array=[]
    student[:name] = profile.css(".student-name").text
    student[:location]=profile.css(".student-location").text
    student[:profile_url]=profile.attr('href a')
    array << student
  end
end 

  def self.scrape_profile_page(profile_url)

  end

end
