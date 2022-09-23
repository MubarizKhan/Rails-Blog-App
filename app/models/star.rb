# frozen_string_literal: true

class Star < ApplicationRecord
  validates :user_id, uniqueness: { scope: %i[starable_id starable_type] }
  belongs_to :starable, polymorphic: true
  belongs_to :user
end
