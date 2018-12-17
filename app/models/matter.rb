class Matter < ApplicationRecord
  # Direct associations

  has_many   :matter_joins,
             :class_name => "Assignment",
             :dependent => :destroy

  has_many   :assets,
             :dependent => :destroy

  # Indirect associations

  has_many   :users,
             :through => :matter_joins,
             :source => :user

  has_many   :transactions,
             :through => :assets,
             :source => :transactions

  has_many   :asset_values,
             :through => :assets,
             :source => :asset_values

  has_many   :organizations,
             :through => :matter_joins,
             :source => :organization

  # Validations

end
