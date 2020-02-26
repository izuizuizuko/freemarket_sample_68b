class CreateProdacts < ActiveRecord::Migration[5.2]
  def change
    create_table :prodacts do |t|
      t.string  :user_id,    null: false, foreign_key: true
      t.string  :name,       null: false
      t.string  :detail,     null: false
      t.integer :category_id, null: false, foreign_key: true
      t.integer :price,      null: false
      t.string  :condition,  null: false
      t.string  :status
      t.string  :burden,     null: false
      t.string  :days,       null: false
      t.timestamps
    end
  end
end

