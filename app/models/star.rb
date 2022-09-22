class Star < ApplicationRecord
  validates :user_id, uniqueness: {scope: [:starable_id, :starable_type] }
  belongs_to :starable, polymorphic: true
  belongs_to :user
end
