class Topic < ApplicationRecord
  after_create :create_topic_status#, on: :create
  # after_commit :create_topic_status, on: :create
  # before_save :remove_whitespaces
  validates :topic_name, presence: true
  # attr_accessor :topic_name
  # after_validation :create_validated_status

  def remove_whitespaces
    # .strip!
    # topic_status = "before validation"
    update_column(:topic_name, topic_name.strip!)
  end

  def create_topic_status
    topic_status = "Newly_Created!"
    update_column(:topic_status, topic_status)
  end

  def create_validated_status
    topic_status = "Newly_Validated!"
    update_column(:topic_status, topic_status)
  end


end
