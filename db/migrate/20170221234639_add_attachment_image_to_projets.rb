class AddAttachmentImageToProjets < ActiveRecord::Migration
  def self.up
    change_table :projets do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :projets, :image
  end
end
