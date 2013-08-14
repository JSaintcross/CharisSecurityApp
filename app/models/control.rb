class Control < ActiveRecord::Base
belongs_to :sources
has_many :subcontrols
belongs_to :families
belongs_to :baselines

  searchable do
    text :ctrlnumber, :title, :description, :supplemental_guidance
  end


end
