class RemoveCitasFromConsultorios < ActiveRecord::Migration
  def up
    remove_index :consultorios, :citas_id
    remove_column :consultorios, :citas
  end

  def down
    add_column :consultorios, :citas, :references
    add_index :consultorios, :citas_id
  end
end
