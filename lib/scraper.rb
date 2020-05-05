require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    doc = Nokogiri::HTML(html)
    array=[]
    doc.css(".roster-cards-container").each do |profile|
    profile.css(".student-card a").each do |info|
    student ={}
    student[:name] = info.css(".student-name").text
    student[:location]=info.css(".student-location").text
    student[:profile_url]="#{info.attr('href')}"
    array << student
  end
  end
  array
end

  def self.scrape_profile_page(profile_url)

  end

end
