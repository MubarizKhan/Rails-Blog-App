class Comment < ApplicationRecord
  # This is very similar to the Article model that you saw earlier.
  # The difference is the line belongs_to :article, which sets up an Active Record association.
  # Active Record associations let you easily declare the relationship between two models.

  # In the case of comments and articles, you could write out the relationships this way:
  # Each comment belongs to one article.
  # One article can have many comments.

  belongs_to :article
end
