class User < ApplicationRecord
    has_secure_password
    has_many :pictures
    validates :password ,length: {minimum: 8}
    validates :email, presence: true
end
