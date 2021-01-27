# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'roo'
require 'faker'
PractitionerIssue.destroy_all
Practitioner.destroy_all
Issue.destroy_all
User.destroy_all
Review.destroy_all
AppointmentNote.destroy_all


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
user2 = User.create(name: "Bill Nye", email: "billys@email.com", password_digest: "asdfg")
user3 = User.create(name: "Bella Thorne", email: "bellas@email.com", password_digest: "asdfg")
user4 = User.create(name: "Ida Wells", email: "idas@email.com", password_digest: "asdfg")

10.times do 
  User.create(
        name: Faker::Name.unique.name, 
        email: Faker::Internet.email, 
        password_digest: "asdfg" 
      )
    end
    
review1= Review.create(comment: "These sessions helped me face fears I thought I would never concur. I will recommend this practitioner to any and everyone.", user_id: user4.id, practitioner_id: Practitioner.first.id)
review1= Review.create(comment: "I really enjoyed my session, I felt heard and understood, The office staff was nice as well", user_id: user3.id, practitioner_id: Practitioner.last.id)
review1= Review.create(comment: "The office staff was not well organized, I had to send my insurance information 3 times!", user_id: user3.id, practitioner_id: Practitioner.first.id)
review1= Review.create(comment: "This practitioner is awesome sauce. They were able to tap in to my problems and give me assignments to work on the issues. I was albe to talk to a family member that I havent been in contact with for 10 years! Thank you!", user_id: user2.id, practitioner_id: Practitioner.last.id)

note1=AppointmentNote.create(title: "Appointment 2/14/2020", notes: "I need to work on being more positive. Start your days with a positive thought", user_id: user3.id)
note2=AppointmentNote.create(title: "Appointment 5/14/2020", notes: "Confidence is there but work on speaking more. Start your days with a positive thought", user_id: user3.id)
note3=AppointmentNote.create(title: "Appointment 8/14/2020", notes: "Talk to mom about thanksgiving and why you were upset. Things i was upset about: the money, the way she asked was triggering", user_id: user3.id)
note4=AppointmentNote.create(title: "Appointment 1/14/2021", notes: "Talk to HR about your options. Remember to have evidence", user_id: user2.id)
