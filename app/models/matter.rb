class Matter < ApplicationRecord
  # Direct associations

  has_many   :assets,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
