class Cat < ApplicationRecord
  has_many :cat_locations, dependent: :destroy
  has_many :locations, through: :cat_locations
  has_many :cat_contacts, dependent: :destroy
  has_many :contacts, through: :cat_contacts
  has_many :health_records, dependent: :destroy
  has_many_attached :photos

  validates :name, presence: true
  validates :status, inclusion: { in: %w[stray feral rescued adopted tnr_complete] }
  validates :gender, inclusion: { in: %w[male female unknown] }

  scope :by_status, ->(status) { where(status: status) }
  scope :spayed_neutered, -> { where(spayed_neutered: true) }
end