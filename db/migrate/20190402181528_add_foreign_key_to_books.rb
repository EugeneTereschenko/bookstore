class AddForeignKeyToBooks < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :books, :categories
  end
end
