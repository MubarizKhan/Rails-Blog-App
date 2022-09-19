class LikesController < ApplicationController

  # def new
  #   @like = Likes.new
  # end

  def create

    @article = Article.find(params[:article_id])
    @like = Like.create(user_id: current_user.id, article_id: @article.id)

    if @like.save
      redirect_to root_path #like_index_path (@article)
    else
      redirect_to archive_article_path
    end
  end

  def destroy
    # @article = Article.find(params[:article_id])


    @like = current_user.likes.find(params[:id])
    # article = @like.article
    @like.destroy

    # redirect_to show
  end

  private
  # def like_params
  #   params.require(:like).permit(:article_id, :user_id)
  # end

end
