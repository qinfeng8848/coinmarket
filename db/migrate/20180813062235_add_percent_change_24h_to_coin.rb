class AddPercentChange24hToCoin < ActiveRecord::Migration[5.2]
  def change
    add_column :coins,  :percent_change_24h,:string
  end
end
