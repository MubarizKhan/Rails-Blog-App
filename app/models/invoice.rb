# frozen_string_literal: true

class Invoice < ApplicationRecord
  # before_action :authenticate_user!
  # scope :discontinued, where(:discontinued => true)
  # scope :cheap, -> {
  #   where(:cheap => true)
  # }
#   scope :cheap, -> { where(cheap: true) }

#   def self.lesser_than(amount)
#     where('price < ?', amount)
#   end

#   scope :cheap, lesser_than(1000)
end
