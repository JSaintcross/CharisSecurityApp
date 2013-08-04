class Refactor < ActiveRecord::Migration
  def up

    create_table :families do |t|
      t.string :title
      t.text :description
      t.string :acronym
    end

    create_table :baselines do |t|
      t.string :title
      t.text :description
    end

    create_table :sources do |t|
      t.string :title
      t.string :versionnum
      t.date :versiondate
      t.text :description
    end

    create_table :controls do |t|
      t.string :ctrlnumber
      t.string :title
      t.belongs_to :family
      t.text :description
      t.text :supplemental_guidance
      t.belongs_to :baseline
      t.belongs_to :source
      t.integer :priority
        t.boolean :withdrawn
    end

    create_table :subcontrols do |t|
      t.integer :subctrlnumber
      t.string :title
      t.text :description
      t.text :supplemental_guidance
      t.boolean :withdrawn
      t.belongs_to :baseline
      t.belongs_to :control
    end
  end

  def down
    drop_table :controls
    drop_table :subcontrols
    drop_table :sources
    drop_table :families
    drop_table :baselines
  end
end
