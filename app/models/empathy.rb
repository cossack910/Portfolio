class Empathy < ApplicationRecord
    validates :review_id, uniqueness: { scope: :user_id }
    belongs_to :user
    belongs_to :review
end
