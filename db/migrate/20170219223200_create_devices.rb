class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :Nom
      t.string :CodeIso
      t.integer :CodeIsoNum
      t.string :Symbole
      t.integer :SousUniteAunite
      t.string :AffichageUnite
      t.boolean :EstSepDecimalActive
      t.string :SepDecimal
      t.boolean :EstSepMillierActive
      t.string :SepMillier
      t.boolean :EstUniteActive

      t.timestamps null: false
    end
  end
end
