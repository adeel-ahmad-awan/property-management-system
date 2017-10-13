class CreateProperties < ActiveRecord::Migration[5.0]
  def change
    create_table :properties do |t|
      t.float :longitude
      t.float :latitude
      t.string :house_num
      t.string :town
      t.string :city
      t.string :country
      t.string :type
      t.boolean :for_sale
      t.boolean :for_rent
      t.integer :price_for_sale
      t.integer :price_for_rent
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
