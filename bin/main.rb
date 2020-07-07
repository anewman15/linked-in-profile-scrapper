require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../lib/article'

doc = Nokogiri::HTML(open('https://www.nytimes.com/topic/subject/space-and-cosmos'))

article_list = doc.css('#stream-panel div ol li')

articles_csv = CSV.open('./article_list.csv', 'a+')
articles_csv << %w[Title Author Summary URL]

article_list.each_with_index do |_article, index|
  new_article = Article.new
  articles_csv << new_article.article_info_arr(article_list[index])
end
