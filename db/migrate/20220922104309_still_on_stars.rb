# frozen_string_literal: true

class StillOnStars < ActiveRecord::Migration[6.1]
  def change
    # remove_index :stars, [:user_id, :starable_id, :starable_type]
    remove_index :stars, name: 'index_stars_on_user_id_and_starable_id_and__starable_type'
    add_index :stars, %i[user_id starable_id starable_type id], unique: true
  end
end
