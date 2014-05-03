class ChangeTimeForBattles < ActiveRecord::Migration
  def change
     change_table :battles do |x|
       x.change :time_start, :date
       x.change :time_end, :date
     end
  end
end
