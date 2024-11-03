class CoffeeStation < ApplicationRecord
  has_many :reports, dependent: :destroy
end
