require 'nokogiri'
require 'open-uri'

class Article
  def initialize; end

  def article_info_arr(article_list)
    [title(article_list), author(article_list), summary(article_list), article_url(article_list)]
  end

  private

  def title(article_list)
    article_list.css('.e1xfvim30').text
  end

  def author(article_list)
    article_list.css('.ea5icrr0 span').text
  end

  def summary(article_list)
    article_list.css('.e1xfvim31').text
  end

  def article_url(article_list)
    link = article_list.css('.css-1l4spti a')
    "https://www.nytimes.com#{link.attr('href')}"
  end
end
