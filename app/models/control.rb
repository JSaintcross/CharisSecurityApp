class Control < ActiveRecord::Base
belongs_to :sources
has_many :subcontrols
belongs_to :families
belongs_to :baselines

  searchable do
    text :ctrlnumber, :boost => 10, :stored => true
    text :title, :boost => 10, :stored => true
    text :description, :supplemental_guidance, :stored => true

  end


end
