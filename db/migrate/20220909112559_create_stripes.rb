class CreateStripes < ActiveRecord::Migration[6.1]
  def change
    create_table :stripes do |t|
      t.string :username
      t.integer :amount

      t.timestamps
    end
  end
end
