class Lawyer < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  belongs_to :user
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone_number, presence:true
  validates :first_name, :uniqueness => { :scope => :last_name }

  has_many :lawyer_specialities, dependent: :destroy
  has_many :specialities, through: :lawyer_specialities

  has_attachment :photo, dependent: :destroy
  has_attachment :office_photo, :default_url => 'https://askthelaw.ae/wp-content/uploads/2016/12/law-office-lawyers-in-your-city.jpg', dependent: :destroy
  monetize :price_cents
end

