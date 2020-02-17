class Review < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :gadget_id, uniqueness: { scope: :user_id }
    validates :good_review, presence: true , length: { minimum: 20}   
    validates :bad_review, presence: true , length: { minimum: 20}
    belongs_to :user
    belongs_to :gadget
    has_many :empathies
end
