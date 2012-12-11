class AddAttachmentArchivoToAdjuntos < ActiveRecord::Migration
  def self.up
    change_table :adjuntos do |t|
      t.has_attached_file :archivo
    end
  end

  def self.down
    drop_attached_file :adjuntos, :archivo
  end
end
