class CreateBattles < ActiveRecord::Migration
  def change
    create_table :battles do |t|
      t.string :name
      t.timestamp :time_start
      t.timestamp :time_end

      t.timestamps
    end
  end
end
