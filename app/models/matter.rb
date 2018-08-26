class Matter < ApplicationRecord
  # Direct associations

  has_one    :relationship,
             :dependent => :destroy

  has_many   :assets,
             :dependent => :destroy

  # Indirect associations

  has_many   :transactions,
             :through => :assets,
             :source => :transactions

  # Validations

end
