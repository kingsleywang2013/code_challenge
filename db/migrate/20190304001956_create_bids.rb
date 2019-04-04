class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.decimal :season
      t.decimal :quantity
      t.decimal :price
      t.integer :seller_id
      t.string :grade

      t.timestamps
    end
  end
end
