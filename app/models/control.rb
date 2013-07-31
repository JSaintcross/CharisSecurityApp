class Control < ActiveRecord::Base
belongs_to :sources
has_many :subcontrols
belongs_to :control_families
belongs_to :baselines

  searchable do
    text :CtrlNumber, :Title, :FamilyID, :SourceID, :Description, :Supplemental_Guidance, :BaselineID, :Priority
  end


end
