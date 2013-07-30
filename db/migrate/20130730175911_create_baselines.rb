class CreateBaselines < ActiveRecord::Migration
  def change
    create_table :baselines do |t|
      t.string :Title
      t.text :Description

      t.timestamps
    end
  end
end
