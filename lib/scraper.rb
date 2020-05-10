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
    html = open(profile_url)
    doc = Nokogiri::HTML(html)
    profile ={}
    links=doc.css(".social-icon-container").children.css("a").map { |el| el.attribute('href').value}

    links.each do |link|
      if link.include?("twitter")
        profile[:twitter] = link

      elsif link.include?("github")
        profile[:github] = link

      elsif link.include?("linkedin")
        profile[:linkedin] = link

      else
        profile[:blog] = link

      end
    end

    profile[:profile_quote] = doc.css(".profile-quote").text
    profile[:bio] = doc.css("div.bio-content.content-holder div.description-holder p").text

    profile
    end

    def self.movie
      html = open("https://www.afi.com/afis-100-years-100-movies/")
      doc = Nokogiri::HTML(html)
      Post = doc.css(".row")
      binding.pry 
    
    end 
end
