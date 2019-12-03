class CommentsController < ApplicationController
  skip_before_action :authorize!, only: [:index]
  before_action :load_article

  # GET /comments
  def index
    comments = @article.comments.page(params[:page]).per(params[:per_page])
    render json: comments
  end

  # POST /comments
  def create
    @comment = @article.comments.build(comment_params.merge(user: current_user))

    @comment.save!
    render json: @comment, status: :created, location: @article
  rescue
    render json: @comment, adapter: :json_api, serializer: ErrorSerializer, status: :unprocessable_entity
  end

  def load_article
    @article = Article.find(params[:article_id])
  end

  private
    def comment_params
      params.require(:data).require(:attributes).permit(:content) || ActionController::Parameters.new
    end
end
