class Subcontrol < ActiveRecord::Base
  belongs_to :controls
  belongs_to :baselines
end
