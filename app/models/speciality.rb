class Speciality < ApplicationRecord
  has_many :lawyer_specialities
  validates :name, uniqueness: true, presence: true
end
