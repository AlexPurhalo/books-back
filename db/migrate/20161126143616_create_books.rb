class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :brief
      t.references :genre

      t.timestamps null: false
    end
  end
end
