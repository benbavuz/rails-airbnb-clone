class Speciality < ApplicationRecord
  validates :name, uniqueness: true, presence: true

  has_many :lawyer_specialities
end
