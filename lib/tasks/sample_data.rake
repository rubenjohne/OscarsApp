require 'faker'

namespace :db do 
  
  desc "Fill database with sample data"
  task :populate => :environment do 
    Rake::Task['db:reset'].invoke 
    
    #create the participant
    Participant.create!(:email => 'ruben@tadashishoji.com', :subscribed => true)
    
    # create the day
    Day.create!(:dayname => "Monday")
    
    # create questions 
    10.times do |n|
      question = 'How to ' + Faker::Company::bs + '?'
      Question.create!(:question => question,
                       :day_id => 1)
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
    
    