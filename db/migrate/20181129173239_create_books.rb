class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :genre, null: false
      t.string :author, null: false
      t.string :image, null: false
      t.string :title, null: false
      t.string :editor, null: false
      t.integer :year, null: false
      t.timestamps
    end
  end
end
