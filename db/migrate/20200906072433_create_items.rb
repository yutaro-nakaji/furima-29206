class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :explanation
      t.integer :category_id
      t.integer :status_id
      t.integer :shipping_charges_id
      t.integer :shipping_region_id
      t.integer :days_until_shipping_id
      t.integer :price
      t.integer :user_id, foreign_key: true
      t.timestamps
    end
  end
end
