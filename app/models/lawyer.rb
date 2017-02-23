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
  has_attachment :office_photo, dependent: :destroy
  monetize :price_cents

  validate :valide_payment_methods

  VALID_PAYMENT_METHODS = [:cb, :cash, :transfer]

  def valide_payment_methods
    payments_to_validate = payments.select { |payment| payment.present? }.map(&:to_sym)

    if payments_to_validate.empty? || (payments_to_validate - VALID_PAYMENT_METHODS).any?
      errors.add("Your payment method is not valid")
    else
      self.payments = payments_to_validate
    end
  end

end

