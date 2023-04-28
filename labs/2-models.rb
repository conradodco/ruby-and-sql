# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/2-models.rb

# **************************
# DON'T CHANGE OR MOVE
Salesperson.destroy_all
# **************************

# Lab 2: Models
# - We've added data into the companies table.  Next, we'll add data
#   into the salespeople table.  Follow the steps below to insert and
#   read rows of salesperson data.  Update a row.  Afterwards, display
#   how many rows have been inserted into the salespeople table.
#   Lastly, if you want a challenge, try writing code to display the
#   full name of each salesperson.

# 1a. check out the schema file
# 1b. check out the model file

# 2. insert 1-2 rows in salespeople table.

salesperson_1 = Salesperson.new
salesperson_1["first_name"] = "John"
salesperson_1["last_name"] = "Smith"
salesperson_1["email"] = "john.smith@email.com"
salesperson_1.save

salesperson_2 = Salesperson.new
salesperson_2["first_name"] = "Jane"
salesperson_2["last_name"] = "Doe"
salesperson_2["email"] = "jane.doe@email.com"
salesperson_2.save

# 3. write code to display how many salespeople rows are in the database

puts "There are #{Salesperson.all.count} salespeople in the table."

# ---------------------------------
# Salespeople: 2

# 4. modify/update column data for a row in the salespeople table.

john = Salesperson.find_by({"first_name" => "John"})
john["first_name"] = "Johnny"
john.save


# CHALLENGE:
# 5. write code to display each salesperson's full name

salespeople = Salesperson.all
# puts salespeople.inspect

for salesperson in salespeople
    puts "#{salesperson["first_name"]} #{salesperson["last_name"]}"
end


# ---------------------------------
# Salespeople: 2
# Ben Block
# Brian Eng
