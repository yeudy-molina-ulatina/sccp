class CreateExpedientes < ActiveRecord::Migration
  def change
    create_table :expedientes do |t|
      t.string :tipo_expediente
      t.date :fecha_creacion
      t.string :tipo_familia

      t.timestamps
    end
  end
end
