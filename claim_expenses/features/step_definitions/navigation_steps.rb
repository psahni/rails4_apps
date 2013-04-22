def build_user_attributes
  @user_attributes||={
                        :email => "prashant.sahni5@gmail.com", 
                        :fullname => "Prashant Sahni",
                        :password => 'pass123', 
                        :password_confirmation => 'pass123',
                        :confirmation_token => nil,
                        :confirmation_sent_at => (Time.now - 3.days),
                        :confirmed_at => (Time.now - 2.days)
                     }
end

def find_user
  @user = User.where(:email => @user_attributes[:email]).first
end

def create_user
 build_user_attributes
 delete_user
 @user = FactoryGirl.create(:user, @user_attributes) 
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_email",    :with => @user_attributes[:email]
  fill_in "user_password", :with => @user_attributes[:password]
  click_button "Submit" 
end

def delete_user
  @user ||= User.where(:email => @user_attributes[:email]).first
  @user.destroy unless @user.nil?
end

#GIVEN


Given /^I am logged in$/ do
  create_user
  sign_in
end


Given /^I exist as a user$/ do
  create_user
end

Given(/^I signed in with valid credentials$/) do
  create_user
  sign_in
end

Given(/^I am on the expenses page$/) do
  create_user
  sign_in
  visit '/expenses'
end

Given(/^I fill in "(.*?)" with '(\d+)\.(\d+)'$/) do |arg1, arg2, arg3|
  fill_in("expense_item_price", :with => "#{arg2}.#{arg3}".to_f)
end

Given(/^I fill in "(.*?)"  with 'Lunch'$/) do |arg1|
  fill_in("expense_item_name", :with => arg1)
end


# May be there is a better way to write it

Given(/^I fill in "(.*?)"   with "(.*?)"$/) do |arg1, arg2|
  select(arg2, :from => 'expense_category_id')
end



#WHEN


When(/^I visit expenses page$/) do
  visit '/expenses'
end


When(/^I press 'Add'$/) do
  click_button 'Add'
end


#THEN

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end


Then(/^page should have notice message "(.*?)"$/) do |arg1|
 sleep 3
 page.should have_content text
end


