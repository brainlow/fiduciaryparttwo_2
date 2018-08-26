class Transaction < ApplicationRecord
  # Direct associations

  belongs_to :asset,
             :counter_cache => true

  # Indirect associations

  has_one    :matter,
             :through => :asset,
             :source => :matter

  # Validations

end
