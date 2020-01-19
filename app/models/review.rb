class Review < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :gadget_id, uniqueness: { scope: :user_id }
    belongs_to :user
    belongs_to :gadget
    has_many :empathies
end
