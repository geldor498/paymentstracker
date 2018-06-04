class Payment < ApplicationRecord
  belongs_to :user
  belongs_to :category
  enum ptype: [ :Expence, :Income ]
end
