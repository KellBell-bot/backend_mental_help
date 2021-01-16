class Issue < ApplicationRecord
    has_many :practitioner_issues
    has_many :practitioners, through: :practitioner_issues
end
