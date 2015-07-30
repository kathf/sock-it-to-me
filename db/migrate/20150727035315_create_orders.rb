class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :sock
      t.references :user
      t.boolean :paid, default: false
      t.boolean :delivered, default: false
      t.boolean :disputed, default: false
      t.boolean :closed, default: false
      t.timestamps null: false
    end
  end
end
