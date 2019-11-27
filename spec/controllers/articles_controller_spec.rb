require 'rails_helper'

describe ArticlesController do
  describe '#index' do 
    it 'should return success responce' do 
      get :index
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do 
      articles = create_list :article, 3
      get :index
      json = JSON.parse(response.body)
      json_data = json['data']
      articles.each_with_index do |article, index|
        expect(json_data[index]['attributes']).to eq({
          'title' => article.title,
          'content' => article.content,
          'slug' => article.slug
        })
      end

    end
  end
end
