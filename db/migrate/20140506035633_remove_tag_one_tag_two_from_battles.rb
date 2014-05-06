class RemoveTagOneTagTwoFromBattles < ActiveRecord::Migration
  def change
    remove_column :battles, :tag_one
    remove_column :battles, :tag_two
  end
end
