class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :name
      t.text :description
      t.timestamps null: false
    end
  end
end
