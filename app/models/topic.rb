class Topic < ApplicationRecord
  # after_create :create_topic_status#, on: :create
  after_commit :create_topic_status, on: :create

  validates :topic_name, presence: true

  after_update :update_topic_status


  # def b_v
  #   topic_status = "bv"
  #   update_column(:topic_status, topic_status)
  # end

  def update_topic_status
    # puts "Topic Status Updated!"
    topic_status = "Topic Status Updated!"
    update_column(:topic_status, topic_status)
  end

  def create_topic_status
    topic_status = "Newly_Created!"
    update_column(:topic_status, topic_status)
  end

  # def create_validated_status
  #   topic_status = "Newly_Validated!"
  #   update_column(:topic_status, topic_status)
  # end


end
