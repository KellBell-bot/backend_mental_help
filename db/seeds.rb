# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'roo'
PractitionerIssue.destroy_all
Practitioner.destroy_all
Issue.destroy_all
User.destroy_all
Review.destroy_all


puts "Importing data"

    data= Roo::Spreadsheet.open('lib/data.xlsx') #opens spreadsheet
    headers = data.row(1) #get header row
    data.each_with_index do |row, idx|
      next if idx == 0 #skips the header while mapping

      practitioner_data = Hash[[headers, row].transpose]
      practitioner = Practitioner.create(practitioner_data.except("issues"))
      issues = practitioner_data["issues"] != nil ?  practitioner_data["issues"].split(", ").uniq : []
      issues.each do |issue_title|
        issue = Issue.find_by(title: issue_title) 
        if(issue == nil)
            new_issue = Issue.create!(title: issue_title)
            practitioner.issues << new_issue
        else
            practitioner.issues << issue
        end
      end
    end

user1 = User.create(name: "Edward Cullin", email: "edwards@email.com", password_digest: "asdfg")
user2 = User.create(name: "Billy Bye", email: "billys@email.com", password_digest: "asdfg")
user3 = User.create(name: "Bella Thorne", email: "bellas@email.com", password_digest: "asdfg")
user4 = User.create(name: "Ida Wells", email: "idas@email.com", password_digest: "asdfg")

# practitioner1= Practitioner.first

review1= Review.create(comment: "I really liked enjoyed my session, I felt heard and understood, The office staff was nice as well", user_id: user4.id, practitioner_id: Practitioner.first.id)