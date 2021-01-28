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
user3 = User.create(name: "Diane Lane", email: "dianes@email.com", password_digest: "asdfg")
user4 = User.create(name: "Ida Wells", email: "idas@email.com", password_digest: "asdfg")

10.times do 
  User.create(
        name: Faker::Name.unique.name, 
        email: Faker::Internet.email, 
        password_digest: "asdfg" 
      )
    end
    
review1= Review.create(comment: "I recently moved back into the DC area and as a result was going in blind to trying to find a psychiatrist. I used mental help. and luckily the first person from their menu of doctors was a great doctor. They had a good bedside manner and genuinely cared about their patients. I would come back to the same practitioner.", user_id: user4.id, practitioner_id: Practitioner.first.id)
review2= Review.create(comment: "She asked the right questions, listened intently, and I felt that she really got who I was after talking to me for 45 minutes.", user_id: user3.id, practitioner_id: Practitioner.last.id)
review3= Review.create(comment: "The office staff was not well organized, I had to send my insurance information 3 times! Rather obnoxious doctor. I felt like I was keeping her from something.", user_id: user3.id, practitioner_id: Practitioner.last.id)
review4= Review.create(comment: "Where do I begin, I went in looking to see if ADHD medication might be something I should try again. Only to have her call and reschedule on me 3X, try and psychoanalyze my personal life, there were several really long uncomfortable pauses where she would just stare at me, I could barely understand her with her accent, and then to top it all off she tried to sell me another 8 sessions with her to see if ADHD medication would be a possibility. No Thank You.", user_id: user3.id, practitioner_id: Practitioner.first.id)
review5= Review.create(comment: "This Dawson was amazing. She was very empathetic and was able to diagnose me on my first visit. I will continue to see her.", user_id: user4.id, practitioner_id: Practitioner.last.id)
review6= Review.create(comment: "Fantastic. I have finally found the right doctor!", user_id: user1.id, practitioner_id: Practitioner.last.id)
review7= Review.create(comment: "She was straightforward and easy to talk to, but it was a very rushed visit for the first time consulting with me.", user_id: user1.id, practitioner_id: Practitioner.last.id)
review8= Review.create(comment: "Fantastic. I have finally found the right doctor!", user_id: user1.id, practitioner_id: Practitioner.first.id)


note1=AppointmentNote.create(title: "First app. with Dr. T 2/14/2020 ", notes: "I need to work on being more positive. Start days with a positive thought, write it down and remind yourself throughout the day", user_id: user3.id)
note2=AppointmentNote.create(title: "App. 5/14/2020", notes: "Confidence is there but work on speaking more. Start your days affirmations. Checkout Affrimtoday.com for inspo", user_id: user3.id)
note3=AppointmentNote.create(title: "Takeaways from 8/14/2020", notes: "Talk to mom about thanksgiving and why you were upset. Things I was upset about: the money, the way she asked was triggering", user_id: user3.id)
note4=AppointmentNote.create(title: "Appointment 1/14/2021", notes: "Talk to HR about your options. Remember to have evidence", user_id: user2.id)
