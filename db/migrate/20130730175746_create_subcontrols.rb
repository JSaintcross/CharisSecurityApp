class CreateSubcontrols < ActiveRecord::Migration
  def change
    create_table :subcontrols do |t|
      t.integer :ParentControlID
      t.integer :ENumber
      t.string :Title
      t.text :Description
      t.text :Supplemental_Guidance
      t.text :BaselineID

      t.timestamps
    end
  end
end
