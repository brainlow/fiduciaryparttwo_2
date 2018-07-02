class Asset < ApplicationRecord
  # Direct associations

  belongs_to :matter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
