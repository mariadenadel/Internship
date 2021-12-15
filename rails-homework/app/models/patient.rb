class Patient < ApplicationRecord
  has_many :appointments
  has_many :physicians, through: :appointments
  has_many :diagnosis_items
  has_many :physicians, through: :diagnosis_items

  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "enter valid email" }
end
