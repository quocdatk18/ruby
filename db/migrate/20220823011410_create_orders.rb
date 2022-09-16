class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.time :date_submited
      t.integer :status
      t.decimal :subtotal
      t.decimal :shipping
      t.decimal :tax
      t.integer :customer_id
      t.decimal :total

      t.timestamps
    end
  end
end
