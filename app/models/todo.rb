class Todo < ApplicationRecord
  belongs_to :user
  validates :description, length: { in: 4..50 }
end
