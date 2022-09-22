class CorrectingStars < ActiveRecord::Migration[6.1]
  def change
    remove_index :stars, :user_id
    add_index :stars, [:user_id, :starable_id, :_starable_type], unique: true
    add_index :stars, [:starable_id, :starable_type]
  end
end
