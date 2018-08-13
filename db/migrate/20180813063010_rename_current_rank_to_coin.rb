class RenameCurrentRankToCoin < ActiveRecord::Migration[5.2]
  def change
    rename_column :coins ,:current_rank,:rank
    rename_column :coins ,:current_cny,:price_cny

  end
end
