# frozen_string_literal: true

class CreateParagraphs < ActiveRecord::Migration[6.1]
  def change
    create_table :paragraphs do |t|
      t.string :name
      t.references :section, null: false, foreign_key: true

      t.timestamps
    end
  end
end
