class Offense < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.']+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, allow_blank: true }
end
