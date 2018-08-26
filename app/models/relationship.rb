class Relationship < ApplicationRecord
  # Direct associations

  belongs_to :organization,
             :required => false,
             :counter_cache => true

  belongs_to :matter

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
