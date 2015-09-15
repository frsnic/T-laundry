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
  }, {
    email: 'frsnic@gmail.com',
    password: 'frsnicfrsnic',
    password_confirmation: 'frsnicfrsnic',
    name: 'frsnic',
    role: User.roles["group_manager"]
  },
]

users = users.each { |user| User.create!(user) }

groups = [{
    title: 'frsnic group'
  }, {
    title: 'a group'
  }
]

groups = groups.each { |group| Group.create!(group) }

GroupUser.create!({
    user_id: User.find_by_name('frsnic').id,
    group_id: Group.find_by_title('frsnic group').id
  }
)

stores = [{
    title: 'frsnic store',
    group_id: Group.find_by_title('frsnic group').id,
    user_id: User.find_by_name('frsnic').id,
  }, {
    title: 'frsnic store 2',
    group_id: Group.find_by_title('frsnic group').id,
    user_id: User.find_by_name('frsnic').id,
  }, {
    title: 'a store',
    group_id: Group.find_by_title('a group').id
  }
]

stores = stores.each do |store|
  Store.create!(store.except(:user_id))
  StoreUser.create!({
      user_id: store[:user_id],
      store_id: Store.find_by_title(store[:title]).id
    }
  ) if store[:user_id]
end
