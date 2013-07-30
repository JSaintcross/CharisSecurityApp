class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.string :CtrlNumber
      t.string :Title
      t.integer :FamilyID
      t.integer :SourceID
      t.text :Description
      t.text :Supplemental_Guidance
      t.integer :BaselineID
      t.integer :Priority

      t.timestamps
    end
  end
end
