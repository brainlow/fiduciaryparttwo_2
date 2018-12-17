class Asset < ApplicationRecord
  # Direct associations

  has_many   :asset_values,
             :dependent => :destroy

  has_many   :transactions,
             :dependent => :destroy

  belongs_to :matter,
             :counter_cache => true

  # Indirect associations

  # Validations

end
