class ArticlesController < ApplicationController
  skip_before_action :authorize!, only: [:index, :show]
  
  def index
    articles = Article.recent.
      page(params[:page]).
      per(params[:per_page])
    render json: articles
  end

  def show
  end

  def create
    article = Article.new(article_params)
    if article.valid?
      #some
    else
      render json: article, adapter: :json_api,
      serializer: ActiveModel::Serializer::ErrorSerializer,
      status: :unprocessable_entity
    end
  end

  def article_params
    ApplicationController:Parameters.new
  end
end
