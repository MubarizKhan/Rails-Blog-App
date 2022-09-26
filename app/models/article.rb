# frozen_string_literal: true

class Article < ApplicationRecord
  # has_many :comments
  include ActiveModel::Dirty

  before_update :old_val
  after_update :checking
  # after_create :pre_creat

  has_many :comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  validates_associated :likes, :comments

  has_many :sections
  has_many :paragraphs, through: :sections
  # The first validation declares that a title value must be present.
  # Because title is a string, this means that the title value must contain at least one non-whitespace character.
  # The second validation declares that a body value must also be present.
  # Additionally, it declares that the body value must be at least 10 characters long.

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  has_many :stars, as: :starable

  # def pre_creat
  #   puts"------------HELLOOOOO----------------"
  #   paragraphs.name = "Newly_created"
  #   puts"----------------------------------------"

  # end

  scope :greater_than_one, -> {where('id > 1')}
  scope :specific_article, ->(para) {where("title = ?", para)}

  scope :created_before, ->(time) { where("created_at < ?", time) if time.present? }

  def old_val
    puts '-----------------------------'
    puts '-----------BEFORE UPDATE CALLBACK------------------'
    puts '-----------------------------'

    # print title
    print title_was
    print title_previously_changed?
    print title_previously_was
    print changes
    puts '-----------------------------'

    puts 'title was updated'
  end

  def checking
    puts '-----------------------------'
    puts '--------AFTER UPDATE CALLBACK---------------------'
    # throw :abort
    puts '-----------------------------'
    # print title
    print title_was
    print title_previously_changed?
    print title_previously_was
    print changes
    # print self.title.rollback!
    print title
    puts '-----------------------------'
  end
end
