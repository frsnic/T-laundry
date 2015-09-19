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

Store.all.each do |store|
  20.times do
    client = store.clients.new
    client.name = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].sample(6).join
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
      item.quantity   = [*(1..10)].sample
      item.sum        = [*(1..1000)].sample
      item.cloth_name = [*('a'..'z'), *('A'..'Z'), *('0'..'9')].sample(10).join
      item.save
    end
  end
end
