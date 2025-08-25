class Todo < ApplicationRecord
    validates :description, length: { in: 4..50 }
    belongs_to :user
end
