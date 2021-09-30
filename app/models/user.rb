class User < ApplicationRecord
    #runs before_save to turn emails incups to lowercase
    before_save {self.email = email.downcase}

    #implements the one to many relationship
    has_many :articles 
    validates :username, presence: true, 
                            uniqueness: {case_sensitive: false}, 
                            length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
                        uniqueness: true, 
                        length: {maximum: 105},
                        format: {with: VALID_EMAIL_REGEX}
    has_secure_password
end
