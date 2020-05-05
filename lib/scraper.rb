require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    array=[]
    doc.css("div.roster-cards-container").each do |profile|
    profile.css(".student-card").each do |info|
      ##binding.pry
    student ={}
    student[:name] = profile.css(".student-name").text
    student[:location]=profile.css(".student-location").text
    student[:profile_url]="#{profile.attr('href')}"
    array << student
  end
  end
  array
end

  def self.scrape_profile_page(profile_url)

  end

end
