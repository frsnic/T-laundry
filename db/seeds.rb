# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

puts "rake db:seed"

users = [{
    email: 'admin@gmail.com',
    password: 'adminadmin',
    password_confirmation: 'adminadmin',
    name: 'admin',
    role: User.roles["admin"]
  }, {
    email: 'client@gmail.com',
    password: 'clientclient',
    password_confirmation: 'clientclient',
    name: 'client',
    role: User.roles["client"]
  }, {
    email: 'no_store@gmail.com',
    password: 'no_storeno_store',
    password_confirmation: 'no_storeno_store',
    name: 'No Store',
    role: User.roles["store_manager"]
  }, {
    email: 'no_group@gmail.com',
    password: 'no_groupno_group',
    password_confirmation: 'no_groupno_group',
    name: 'No Group',
    role: User.roles["group_manager"]
  },
]

users = users.each { |user| User.create!(user) }

chuck = User.create({
  email: 'chuck@gmail.com',
  password: 'chuckchuck',
  password_confirmation: 'chuckchuck',
  name: 'Chuck',
  role: User.roles["group_manager"]
})

sarah = User.create({
  email: 'sarah@gmail.com',
  password: 'sarahsarah',
  password_confirmation: 'sarahsarah',
  name: 'Sarah',
  role: User.roles["store_manager"]
})

chuck_group = Group.create({
  title: 'Chuck Group',
  precision: 0
})

chuck.groups << chuck_group

sarah_store = Store.create({
  title: 'Sarah Store',
  group_id: chuck_group.id
})

sarah.stores << sarah_store

Store.all.each do |store|
  20.times do
    client = store.clients.new
    client.name = [*
      "Iris Moore",
      "Juanita Hamilton",
      "Jerry Allen",
      "Fannie Burke",
      "Kurt Briggs",
      "Nichole Padilla",
      "Kendra Casey",
      "Kyle Steele",
      "Lela Bowman",
      "Connie Roy",
      "Wendell Bass",
      "Nick Walker",
      "Grady Stewart",
      "Randolph Allison",
      "Tonya Graves",
      "Angel Newman",
      "Sonya Quinn",
      "Aubrey Nash",
      "Traci Morris",
      "Dustin Lambert",
      "Marion Gonzales",
      "Jeanne Figueroa",
      "Mike Blair",
      "Randal Singleton",
      "Willis Hale"
    ].sample
    client.phone = [*('0'..'9')].sample(10).join
    client.save
  end
end

Store.all.each do |store|
  20.times do
    order = store.orders.new
    order.client_id = store.clients.pluck(:id).sample
    order.user_id   = store.store_managers.pluck(:id).sample
    order.price     = [*(1..1000)].sample
    order.save
    [*(1..5)].sample.times do
      item = order.order_items.new
      item.price        = [*(1..100)].sample
      item.cloth_title  = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].sample(10).join
      item.status       = [*(0..2)].sample
      item.save
    end
  end
end

Group.all.each do |group|
  30.times do |index|
    cloth = group.cloths.new
    cloth.title = 'Cloth ' + (index + 1).to_s
    cloth.save
  end
end

OrderItem.where(status: OrderItem.statuses[:out]).update_all(fetched_at: Time.now())
