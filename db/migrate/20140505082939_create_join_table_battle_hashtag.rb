class CreateJoinTableBattleHashtag < ActiveRecord::Migration
  def change
    create_table :battles_hashtags, :id => false do |t|
      t.belongs_to :battle, :hashtag
    end

    add_index :battles_hashtags, [:battle_id, :hashtag_id]
    end
end
