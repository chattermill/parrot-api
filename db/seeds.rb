# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.create!(email: "lokon@example.com", 
                  password: "shlyapa1943", 
                  password_confirmation: "shlyapa1943") 

MailchimpList.create!(name: "Chattermill Beta List",
                    user: user,
                    mailchimp_id: "0bebf552d9")