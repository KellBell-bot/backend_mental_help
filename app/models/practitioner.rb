class Practitioner < ApplicationRecord
    has_many :reviews, dependent: :destroy
    has_many :users, through: :reviews
    has_many :practitioner_issues
    has_many :issues, through: :practitioner_issues

    def filter_issues
        self.issues.map {|issue| {title: issue.title}}
    end
end
