# frozen_string_literal: true

class Topic < ApplicationRecord
  # after_create :create_topic_status#, on: :create
  include ActiveModel::Dirty

  after_commit :create_topic_status, on: :create

  validates :topic_name, presence: true

  after_update :update_topic_status

  def update_topic_status
    # puts "Topic Status Updated!"
    topic_status = 'Topic Status Updated!'
    update_column(:topic_status, topic_status)
  end

  def create_topic_status
    topic_status = 'Newly_Created!'
    update_column(:topic_status, topic_status)
  end

  scope :after_updation, -> { where(topic_status: 'Topic Status Updated!') }

  # def index
end
