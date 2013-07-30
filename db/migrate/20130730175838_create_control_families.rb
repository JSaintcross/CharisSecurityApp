class CreateControlFamilies < ActiveRecord::Migration
  def change
    create_table :control_families do |t|
      t.string :Title
      t.text :Description
      t.string :Acronym

      t.timestamps
    end
  end
end
