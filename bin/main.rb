require 'nokogiri'
require 'open-uri'
require_relative '../lib/article'


doc = Nokogiri::HTML(open("https://www.nytimes.com/topic/subject/space-and-cosmos"))

article_list = doc.css('#stream-panel div ol li')

article_list.each do |article|
  article = Article.new
  puts article.article_info_arr(article_list)
end
