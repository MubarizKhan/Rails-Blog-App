# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user_id
  belongs_to :article_id


end
