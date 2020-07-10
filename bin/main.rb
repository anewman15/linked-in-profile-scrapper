#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'csv'
require_relative '../lib/article'

open_nyt_url = URI.open('https://www.nytimes.com/topic/subject/space-and-cosmos')
doc = Nokogiri::HTML(open_nyt_url)
article_list = doc.css('#stream-panel div ol li')

articles_csv = CSV.open('./article_list.csv', 'a+')
articles_csv << %w[Title Author Summary URL]

article_list.each_with_index do |_article, index|
  begin
    open_nyt_url
  rescue StandardError => e
    puts "Error: #{e}"
  else
    new_article = Article.new
    articles_csv << new_article.article_info_arr(article_list[index])
  ensure
    puts 'Making sure data is being scrapped...'
    sleep 1
  end
end
