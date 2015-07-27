class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :sock
      t.references :user
      t.boolean :paid
      t.boolean :delivered
      t.boolean :disputed
      t.boolean :closed
      t.timestamps null: false
    end
  end
end
