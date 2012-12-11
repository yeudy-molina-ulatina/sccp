class CreateAdjuntos < ActiveRecord::Migration
  def change
    create_table :adjuntos do |t|
      
      t.string :nombre_archivo
      t.string :url_archivo

      t.timestamps
    end
  end
end
