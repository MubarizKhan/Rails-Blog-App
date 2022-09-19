# frozen_string_literal: true

class Article < ApplicationRecord
  # has_many :comments
  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  # The first validation declares that a title value must be present.
  # Because title is a string, this means that the title value must contain at least one non-whitespace character.
  # The second validation declares that a body value must also be present.
  # Additionally, it declares that the body value must be at least 10 characters long.

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 1 }

  # def liked?(user)
  #   !!self.likes.find{|like| like.user_id == user.id}
  # end


end
