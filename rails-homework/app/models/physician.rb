class Physician < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :diagnosis_items
  has_many :patients, through: :diagnosis_items
end
