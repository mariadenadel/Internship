class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :diagnosis_items
  has_many :patients, through: :diagnosis_items

  validates :phone_number, presence: true, format: { with: /\A\+380[\d]{9}\z/, message: "enter valid UA phone number" }
  validates :level, presence: true, inclusion: { in: %w(junior middle senior) }
end
