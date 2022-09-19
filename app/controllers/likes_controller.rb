class LikesController < ApplicationController

  # def new
  #   @like = Likes.new
  # end

  def create

    @article = Article.find(params[:article_id])
    @like = @article.likes.create(user_id: current_user.id, article_id: @article.id)

    if @like.save
      redirect_to root_path #like_index_path (@article)
    else
      redirect_to archive_article_path
    end
  end

  def destroy
    # @article = Article.find(params[:article_id])
    user_id = current_user.id
    @article = Article.find(params[:id])

    @like = @article.likes.find(:user_id)
    # @like = Like.find(params[:self.:id])
    @like.destroy

    # redirect_to show
  end

  private
  def like_params
    params.permit(:article_id, :user_id)
  end

end
