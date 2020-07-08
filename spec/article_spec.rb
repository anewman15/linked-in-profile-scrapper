require_relative '../lib/article'

describe Article do
  describe '#article_info_arr' do
    let(:doc) { Nokogiri::HTML(URI.open('https://www.nytimes.com/topic/subject/space-and-cosmos')) }
    let(:li_tag) { doc.css('#stream-panel div ol li')[0] }
    let(:article1) { Article.new }

    context 'when a li tag is given as an argument' do
      it 'returns an array with article info' do
        title = 'Scrutinizing SpaceX, NASA Overlooked Some Boeing Software Problems'
        author = 'Kenneth Chang'
        summary = 'The agency identified the causes of mishaps in orbit during an uncrewed
         test flight of its Starliner spacecraft in December.'
        article_url = 'https://www.nytimes.com/2020/07/07/science/boeing-starliner-nasa.html'
        expect(article1.article_info_arr(li_tag)).to eq([title, author, summary, article_url])
      end
    end
  end
end
