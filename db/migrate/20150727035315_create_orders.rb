class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :sock
      t.string :stripe_token
      t.integer :amount
      t.string :description
      t.string :payment_reference
      t.boolean :paid, default: false
      t.timestamps null: false
    end
  end
end
