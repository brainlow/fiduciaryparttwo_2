class AssetValue < ApplicationRecord
  # Direct associations

  belongs_to :asset

  # Indirect associations

  has_one    :matter,
             :through => :asset,
             :source => :matter

  # Validations

end
