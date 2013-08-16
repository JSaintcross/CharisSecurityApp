class Control < ActiveRecord::Base
belongs_to :sources
has_many :subcontrols
belongs_to :families
belongs_to :baselines

  searchable do
    text :ctrlnumber, :boost => 5
    text :title, :boost => 3
    text :description, :supplemental_guidance 

  end


end
