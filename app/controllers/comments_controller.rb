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

    if @comment.save
      render json: @comment, status: :created, location: @article
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def load_article
    @article = Article.find(params[:article_id])
  end

  private
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:content, :article_id)
    end
end
