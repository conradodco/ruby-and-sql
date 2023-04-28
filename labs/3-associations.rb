# This is a Rails app and we want to load all the files in the app 
# when running this code.  To do so, your current working directory
# should be the top-level directory (i.e. /workspace/your-app/) and then run:
# rails runner labs/3-associations.rb

# **************************
# DON'T CHANGE OR MOVE
Activity.destroy_all
# **************************

# Lab 3: Associations
# - We've added data into the contacts table.  Next, we'll add data
#   into the activities table.  Follow the steps below to insert
#   activity data in the database.  Afterwards, display a
#   single salesperson's activity data:

# 1. insert 3 rows in the activities table with relationships to
# a single salesperson and 2 different contacts

# Creating second contact

apple = Company.find_by({"name" => "Apple"})
new_contact = Contact.new
new_contact["first_name"] = "Steve"
new_contact["last_name"] = "Jobs"
new_contact["email"] = "Steve@apple.com"
new_contact["company_id"] = apple["id"]
new_contact.save

# Creating id finders

john = Salesperson.find_by({"first_name" => "Johnny"})
contact_1 = Contact.find_by({"first_name" => "Tim"})
contact_2 = Contact.find_by({"first_name" => "Steve"})

# Insert rows
new_activity = Activity.new
new_activity["salesperson_id"] = john["id"]
new_activity["contact_id"] = contact_1["id"]
new_activity["note"] = "Sent an email to Tim from Apple."
new_activity.save

new_activity = Activity.new
new_activity["salesperson_id"] = john["id"]
new_activity["contact_id"] = contact_1["id"]
new_activity["note"] = "Booked a call with Tim from Apple."
new_activity.save

new_activity = Activity.new
new_activity["salesperson_id"] = john["id"]
new_activity["contact_id"] = contact_2["id"]
new_activity["note"] = "Asked Steve from Apple for a new iphone."
new_activity.save

# 2. Display all the activities between the salesperson used above
# and one of the contacts (sample output below):

activities = Activity.where({"salesperson_id" => john["id"]})

puts "Activities done by John:"
for activity in activities
    puts "- #{activity["note"]}"
end
# ---------------------------------
# Activities between Ben and Tim Cook:
# - quick checkin over facetime
# - met at Cupertino

# CHALLENGE:
# 3. Similar to above, but display all of the activities for the salesperson
# across all contacts (sample output below):

# ---------------------------------
# Ben's Activities:
# Tim Cook - quick checkin over facetime
# Tim Cook - met at Cupertino
# Jeff Bezos - met at Blue Origin HQ

# 3a. Can you include the contact's company?

# ---------------------------------
# Ben's Activities:
# Tim Cook (Apple) - quick checkin over facetime
# Tim Cook (Apple) - met at Cupertino
# Jeff Bezos (Amazon) - met at Blue Origin HQ

# CHALLENGE:
# 4. How many activities does each salesperson have?

# ---------------------------------
# Ben Block: 3 activities
# Brian Eng: 0 activities
