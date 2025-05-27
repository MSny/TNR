class Location < ApplicationRecord
  has_many :cat_locations, dependent: :destroy
  has_many :cats, through: :cat_locations

  validates :name, presence: true
  validates :latitude, :longitude, presence: true, numericality: true

  geocoded_by :address
  after_validation :geocode, if: ->(obj){ obj.address.present? and obj.address_changed? }

  def current_cats
    cat_locations.joins(:cat).where(last_seen: 30.days.ago..Time.current)
  end
end