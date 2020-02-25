class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer	:user_id, null: false, foreign_key: true
      t.string :address_number, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :town
      t.string :house_number
      t.timestamps
    end
  end
end
