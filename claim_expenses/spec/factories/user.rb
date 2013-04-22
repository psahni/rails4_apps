# Read more here https://github.com/thoughtbot/factory_girl_rails

FactoryGirl.define do
  factory :user do
    fullname 'Prashant Sahni'
    email 'prashant.sahni5@gmail.com'
    password 'pass123'
    password_confirmation 'pass123'
    confirmation_token  nil
    confirmation_sent_at  Time.now - 3.days
    confirmed_at  Time.now - 2.days
   end
    
end


