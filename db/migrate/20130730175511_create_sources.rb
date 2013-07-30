class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :Title
      t.string :VersionNum
      t.date :VersionDate
      t.text :Description

      t.timestamps
    end
  end
end
