class Control < ActiveRecord::Base
belongs_to :sources
has_many :subcontrols
belongs_to :control_families
belongs_to :baselines
end
