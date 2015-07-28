class CreateSocks < ActiveRecord::Migration
  def change
    create_table :socks do |t|
      t.string :fabric
      t.string :height
      t.string :size
      t.boolean :toes_separator
      t.boolean :big_toe_separator
      t.boolean :heel_padding
      t.text :comments
      t.timestamps null: false
    end
  end
end
