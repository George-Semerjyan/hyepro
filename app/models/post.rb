class Post < ApplicationRecord
    has_one_attached :image
    
    validates :strain_name, presence: true
    validates :description, presence: true
    validate :correct_image_type
    validates :price, presence: true
    validates :category, presence: true
    validates :phone, length: { minimum: 10 }, presence: true
    validates :email, presence: true
    validates :city, presence:true
    
    private
    
    def correct_image_type
        if  image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
            errors.add(:image, 'must be a JPEG or PNG.')
            elsif image.attached? == false
            errors.add(:image, 'required.')
        end
    end
    
end
