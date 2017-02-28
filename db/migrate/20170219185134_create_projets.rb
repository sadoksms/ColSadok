class CreateProjets < ActiveRecord::Migration
  def change
    create_table :projets do |t|
      t.string :name
      t.float :objective
      t.integer :device_id

      t.timestamps null: false
    end
  end
end
