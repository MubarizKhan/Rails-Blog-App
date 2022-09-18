# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :article_id

  def like
    @article = Article.all.find(params[:id])
    Like.create(user_id: current_user.id, article)
end
