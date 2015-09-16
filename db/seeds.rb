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
    name: 'admin',
    role: User.roles["admin"]
  }, {
    email: 'group@gmail.com',
    password: 'groupgroup',
    password_confirmation: 'groupgroup',
    name: 'group_manager',
    role: User.roles["group_manager"]
  }, {
    email: 'store@gmail.com',
    password: 'storestore',
    password_confirmation: 'storestore',
    name: 'store_manager',
    role: User.roles["store_manager"]
  }, {
    email: 'client@gmail.com',
    password: 'clientclient',
    password_confirmation: 'clientclient',
    name: 'client',
    role: User.roles["client"]
  },
]

users = users.each { |user| User.create!(user) }

frsnicg = User.create({
  email: 'frsnicg@gmail.com',
  password: 'frsnicgfrsnicg',
  password_confirmation: 'frsnicgfrsnicg',
  name: 'frsnicg',
  role: User.roles["group_manager"]
})

frsnics = User.create({
  email: 'frsnics@gmail.com',
  password: 'frsnicsfrsnics',
  password_confirmation: 'frsnicsfrsnics',
  name: 'frsnics',
  role: User.roles["store_manager"]
})

frsnic_group = Group.create({
  title: 'frsnic group',
})

frsnicg.groups << frsnic_group

frsnics_store = Store.create({
  title: 'frsnics store',
  group_id: frsnic_group.id
})

frsnics.stores << frsnics_store
