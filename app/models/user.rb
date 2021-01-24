class User < ApplicationRecord
    has_many :reviews
    has_many :appointment_notes
    has_many :practitioners, through: :reviews

    has_secure_password

    validates_presence_of :name
    validates_presence_of :email
    validates_uniqueness_of :email

    def filter_reviews
        self.reviews.map{|review| {comment: review.comment, practitioner_id: review.practitioner_id}}
    end

    # def filter_notes
    #     self.appointment_notes.map{|note| {title: note.title, notes: notes.notes}}
    # end
end
