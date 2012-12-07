class AddHoraFinFromCitas < ActiveRecord::Migration
  def change
    add_column :citas, :hora_fin, :time
  end
end
