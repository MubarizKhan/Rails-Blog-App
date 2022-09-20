# frozen_string_literal: true

class CreateInvoices < ActiveRecord::Migration[6.1]
  def change
    create_table :invoices do |t|
      t.string :username
      t.integer :amount

      t.timestamps
    end
  end
end
