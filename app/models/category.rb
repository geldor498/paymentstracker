class Category < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy  
  enum ctype: [ :Expences, :Income ]
  validates :name, presence: true,
                    length: { minimum: 5 }
end
