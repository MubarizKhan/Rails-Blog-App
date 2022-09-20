# frozen_string_literal: true

class Article < ApplicationRecord
  # has_many :comments
  include ActiveModel::Dirty

  before_update :old_val
  after_update :checking

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  validates_associated :likes, :comments
  # The first validation declares that a title value must be present.
  # Because title is a string, this means that the title value must contain at least one non-whitespace character.
  # The second validation declares that a body value must also be present.
  # Additionally, it declares that the body value must be at least 10 characters long.

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  def old_val

      puts "-----------------------------"
      puts "-----------BEFORE UPDATE CALLBACK------------------"
      puts "-----------------------------"

      # print title
      print self.title_was
      print self.title_previously_changed?
      print self.title_previously_was
      print self.changes
      puts "-----------------------------"

      puts "title was updated"

  end


  def checking
    puts "-----------------------------"
    puts "--------AFTER UPDATE CALLBACK---------------------"
    puts "-----------------------------"
      # print title
      print self.title_was
      print self.title_previously_changed?
      print self.title_previously_was
      print self.changes
      puts "-----------------------------"

  end


end
