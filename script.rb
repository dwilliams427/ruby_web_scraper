require 'httparty'
require 'nokogiri'
require 'byebug'
require 'pry'


def scraper
  url = "https://jobs.intel.com/ShowJob/Id/2994359/Graphics%20Software%20Engineer%20%20%20Intern"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  listing = parsed_page.css("p").text
  # puts "unparsed page =============================================", unparsed_page
  # puts "parsed page =============================================", parsed_page
  # array = parsed_page.css('body').map(&:text)
  
  # pp "array=======================================================", array[0]

  split_listing = listing.downcase.split(" ")
  # p split_listing

  most_frequent_item(split_listing)

  # byebug
end



def most_frequent_item(array)
  most_frequent_words = {}
  if array == []
    return "Nothing here"
  else
    array.each do |str|
      if most_frequent_words[str]
        most_frequent_words[str] += 1
      else
        most_frequent_words[str] = 1
      end
    end
    pp most_frequent_words.sort_by{|k,v| v }
  end
end

scraper