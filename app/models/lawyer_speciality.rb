class LawyerSpeciality < ApplicationRecord
  belongs_to :lawyer
  belongs_to :speciality

  validates_uniqueness_of :lawyer_id, :scope => :speciality_id
end
