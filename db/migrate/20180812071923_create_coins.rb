class CreateCoins < ActiveRecord::Migration[5.2]
  def change
    create_table :coins do |t|
      t.string :coin_id
      t.string :name
      t.string :symbol
      t.string :current_rank
      t.string :current_cny
      t.timestamps
    end
  end
end
