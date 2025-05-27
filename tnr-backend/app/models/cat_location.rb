class CatLocation < ApplicationRecord
  belongs_to :cat
  belongs_to :location
end
