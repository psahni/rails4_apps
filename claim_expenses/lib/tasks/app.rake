namespace :db do
  
  # rake db:insert_categories
  desc "This task bootstraps categories into database"
  task :insert_categories => :environment do
    expense_categories = ["Lunch", "Fruits", "Tissue Papers", "Office Maintenance ", "Computer Hardware", "Computer Software", "Transport"]
    
    expense_categories.each do |category|
      new_category = ExpenseCategory.new(:name => category)
      if new_category.save
        puts %{ #{ category } has been saved successfully } 
      else
        puts "#{ category }" + " "*5 + " Not Saving!! : #{ new_category.errors.messages.inspect }"  
      end
      
    end# end
    
  end #task
end# namespace
