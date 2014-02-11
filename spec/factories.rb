FactoryGirl.define do 
  factory :user do 
    name      "Ruben Epong"
    email     "ruben@tadashishoji.com"
    password  "foobar"
    password_confirmation "foobar"
  end
  
  factory :participant do
    email       "user@participant.com"
    subscribed  true
  end
  
end