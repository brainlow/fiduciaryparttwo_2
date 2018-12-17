class Assignment < ApplicationRecord
  # Direct associations

  belongs_to :organization

  belongs_to :matter,
             :counter_cache => :matter_joins_count

  belongs_to :user

  # Indirect associations

  # Validations

end
