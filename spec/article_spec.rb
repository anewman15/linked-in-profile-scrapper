require_relative '../lib/article'

describe Article do
  describe '#article_info_arr' do
    let(:doc) { Nokogiri::HTML(URI.open('https://www.nytimes.com/topic/subject/space-and-cosmos')) }
    let(:li_tag) { doc.css('#stream-panel div ol li')[0] }
    let(:article1) { Article.new }

    context 'when a li tag is given as an argument' do
      it 'returns an array with article info' do
        title = li_tag.css('.e1xfvim30')[0].text
        author = li_tag.css('.ea5icrr0 span')[0].text
        summary = li_tag.css('.e1xfvim31')[0].text
        link = li_tag.css('.css-1l4spti a')[0]
        article_url = "https://www.nytimes.com#{link.attr('href')}"
        expect(article1.article_info_arr(li_tag)).to eq([title, author, summary, article_url])
      end
    end
  end
end
