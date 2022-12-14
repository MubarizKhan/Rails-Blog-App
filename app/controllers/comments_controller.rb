# frozen_string_literal: true

class CommentsController < ApplicationController
  # You'll see a bit more complexity here than you did in the controller for articles.
  # That's a side-effect of the nesting that you've set up. Each request for a comment has to keep track of
  # the article to which the comment is attached, thus the initial call to the find method of the Article
  # model to get the article in question.

  # In addition, the code takes advantage of some of the methods available for an association.
  # We use the create method on @article.comments to create and save the comment.
  # This will automatically link the comment so that it belongs to that particular article.

  # Once we have made the new comment,
  # we send the user back to the original article using the article_path(@article) helper.
  # As we have already seen, this calls the show action of the ArticlesController
  # which in turn renders the show.html.erb template. This is where we want the comment to show,
  # so let's add that to the app/views/articles/show.html.erb.

  def create
    # if user_signed_in?
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
    # end
  end

  def edit
    @article = Article.find(params[:id])
    @comment = @article.comments.find(params[:article_id])
  end

  def update
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])

    if @comment.update(comment_params)
      flash[:notice] = 'You updated your comment!'
      @comment.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
