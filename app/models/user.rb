class User < ApplicationRecord
    has_secure_password
    has_many :trades
    validates :name, :last_name, :email, :dob, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email, uniqueness: true
    validates :password, presence: true, on:  :create, on: :update
    validates :password, confirmation: { case_sensitive: true }, on:  :create, on: :update
end
