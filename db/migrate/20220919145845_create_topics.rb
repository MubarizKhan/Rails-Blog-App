# frozen_string_literal: true

class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics do |t|
      t.string :topic_name
      t.string :topic_status

      t.timestamps
    end
  end
end
