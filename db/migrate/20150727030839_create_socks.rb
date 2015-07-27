class CreateSocks < ActiveRecord::Migration
  def change
    create_table :socks do |t|
      t.string :material
      t.decimal :height_cm, precision: 4, scale: 2
      t.integer :size
      t.boolean :fingertoes
      t.boolean :heel_padding
      t.text :comments
      t.timestamps null: false
    end
  end
end
