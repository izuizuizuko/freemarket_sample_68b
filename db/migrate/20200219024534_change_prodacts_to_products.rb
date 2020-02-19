class ChangeProdactsToProducts < ActiveRecord::Migration[5.2]
  def change
    rename_table :prodacts, :products
  end
end
