class CreateDeliveries < ActiveRecord::Migration[7.0]
  def change
    create_table :deliveries do |t|
      t.references :order,     null: false, foreign_key: true
      t.string :post_code,     null: false
      t.integer :region_id,    null: false
      t.string :city,          null: false
      t.string :address,       null: false
      t.string :building
      t.string :tel_number,     null: false
      t.timestamps
    end
  end
end
