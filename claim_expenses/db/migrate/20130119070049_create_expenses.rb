class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.string  :item_name, :null => false
      t.decimal :item_price, :precision => 10,:scale => 3
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
