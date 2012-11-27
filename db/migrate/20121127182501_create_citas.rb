class CreateCitas < ActiveRecord::Migration
  def change
    create_table :citas do |t|
      t.date :fecha
      t.string :lugar_atencion
      t.string :hora
      t.string :duracion

      t.timestamps
    end
  end
end
