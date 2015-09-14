# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "rake db:seed"

users = [{
    email: 'admin@gmail.com',
    password: 'adminadmin',
    password_confirmation: 'adminadmin',
    name: 'admin'
  },{
    email: 'frsnic@gmail.com',
    password: 'frsnicfrsnic',
    password_confirmation: 'frsnicfrsnic',
    name: 'frsnic'
  }
]

users = users.each { |user| User.create!(user) }

groups = [{
    title: 'frsnic group'
  }
]

groups = groups.each { |group| Group.create!(group) }

GroupUser.create!({
    user_id: User.find_by_name('frsnic').id,
    group_id: Group.find_by_title('frsnic group').id
  }
)
