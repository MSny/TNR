class CatContact < ApplicationRecord
  belongs_to :cat
  belongs_to :contact
end
