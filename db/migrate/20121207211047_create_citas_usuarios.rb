class CreateCitasUsuarios < ActiveRecord::Migration
  def change
    create_table :citas_usuarios, :id => false do |t|
      t.references :cita
      t.references :usuario
    end
    add_index :citas_usuarios, :cita_id
    add_index :citas_usuarios, :usuario_id
  end
end
