#require 'faker'

namespace :db do 
  
  desc "Fill database with sample data"
  task :populate => :environment do 
    Rake::Task['db:reset'].invoke 
    
    # create a user to pass the test so annoying!
    User.create!(:name => "Ruben Epong", :email => "ruben@tadashishoji.com", :password => "foobar", :password_confirmation => "foobar")
   
    #create the participant
    Participant.create!(:email => 'ruben@tadashishoji.com', :subscribed => true)
    
    # create the day
    Day.create!(:dayname => "Monday")
    
    # create questions 
    10.times do |n|
      question = 'How to ' + Faker::Company::bs + '?'
      num = n + 1
      Question.create!(:question => question,
                       :day_id => 1,
                       :num => num)
      # create choices for each question                 
      5. times do |t|
        choice = Faker::Company::bs
        explanation = Faker::Company::catch_phrase + '!!!' 
        correct = [true, false].sample
        question_id = n + 1
        Choice.create!(:choice => choice,
                       :explaination => explanation,
                       :correct => correct,
                       :question_id => question_id)
      end
      
    end
  
  end  
    
end
    
    