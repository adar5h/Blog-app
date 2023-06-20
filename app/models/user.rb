class User < ApplicationRecord
    has_many :articles, dependent: :destroy # specifying that associated records should be destroyed when the parent record is destroyed
    has_secure_password
    before_save {self.email = email.downcase} # self because we're referring to each object of the user class
    before_save {self.username = username.slice(0).capitalize + username.slice(1..-1) }
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3, maximum: 25}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 100}, format: {with: VALID_EMAIL_REGEX}
end
