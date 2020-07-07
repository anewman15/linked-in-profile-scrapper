require 'nokogiri'
require 'open-uri'

class Article

  def initialize
    
  end

  def article_info_arr(doc)
    [title(doc), author(doc), summary(doc), article_url(doc)]
  end

  private

  def title(doc)
    doc.css('.e1xfvim30').text
  end

  def author(doc)
    doc.css('.ea5icrr0 span').text
  end

  def summary(doc)
    doc.css('.e1xfvim31').text
  end

  def article_url(doc)
    link = doc.css(".css-1l4spti a")
    article_url = "https://www.nytimes.com/topic/subject/space-and-cosmos#{link.attr('href')}"
  end
end