class RenameHoraFromCitas < ActiveRecord::Migration
  def self.up
    rename_column :citas, :hora, :hora_inicio
  end

  def self.down
    rename_column :citas, :hora_inicio, :hora
  end
end
