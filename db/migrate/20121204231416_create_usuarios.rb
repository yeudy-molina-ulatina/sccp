class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :usuario
      t.string :password_digest
      t.string :nombre
      t.string :apellido1
      t.string :apellido2
      t.string :correo_electronico
      t.references :rol

      t.timestamps
    end
    add_index :usuarios, :rol_id
  end
end
