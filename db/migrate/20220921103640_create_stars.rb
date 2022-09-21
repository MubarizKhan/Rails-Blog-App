class CreateStars < ActiveRecord::Migration[6.1]
  def change
    create_table :stars do |t|
      t.string :starable_type
      t.integer :starable_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
