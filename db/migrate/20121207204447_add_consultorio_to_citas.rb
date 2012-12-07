class AddConsultorioToCitas < ActiveRecord::Migration
  def up
    change_table :citas do |t|      
      t.references :consultorio
    end
    add_index :citas, :consultorio_id
  end
 
  def down
    remove_index :citas, :consultorio_id
    remove_column :citas, :consultorio_id
  end  
end
