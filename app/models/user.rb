class User < ApplicationRecord
    has_many :reviews
    has_many :appointment_notes
    has_many :practitioners, through: :reviews

    has_secure_password

    validates_presence_of :name
    validates_presence_of :email
    validates_uniqueness_of :email
end