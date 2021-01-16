class Practitioner < ApplicationRecord
    has_many :reviews
    has_many :users, through: :reviews
    has_many :practitioner_issues
    has_many :issues, through: :practitioner_issues
end
