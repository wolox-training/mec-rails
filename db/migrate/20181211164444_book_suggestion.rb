class BookSuggestion < ActiveRecord::Migration[5.2]
  def change
    create_table :book_suggestions do |t|
      t.references :user, foreign_key: true
      t.string :genre, null: false
      t.string :author, null: false
      t.string :image, null: false
      t.string :title, null: false
      t.string :editor, null: false
      t.integer :year, null: false
      t.string :synopsis, null: false
      t.float :price, null: false
      t.timestamps
    end
  end
end
