class CreateArchivos < ActiveRecord::Migration
  def change
    create_table :archivos do |t|
      t.references :motivo_consulta
      t.string :url

      t.timestamps
    end
    add_index :archivos, :motivo_consulta_id
  end
end
