class Star < ApplicationRecord
  belongs_to :starable, polymorphic: true
  belongs_to :user
end
