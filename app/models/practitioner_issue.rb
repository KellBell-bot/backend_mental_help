class PractitionerIssue < ApplicationRecord
  belongs_to :practitioner
  belongs_to :issue
end
