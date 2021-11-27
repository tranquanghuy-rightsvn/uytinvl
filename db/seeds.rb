# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CATEGORY = ["Phap luat", "Doi song", "Bong da", "Giai tri"]
CHANNEL = ["Sang vlog", "Khoa Pug", "Toidicodedao", "Khoai lang thang"]

ActiveRecord::Base.transaction do
  user = User.create! email: "bacluong@gmail.com", password: "123123", name: "Bac xa"
  user_2 = User.create! email: "quanghuy@gmail.com", password: "123123", name: "Quang Huy"
  user_3 = User.create! email: "thuytien@gmail.com", password: "123123", name: "Thuy Tien"

  4.times do |n|
   	Category.create! name: CATEGORY[n]
  end

  4.times do |n|
  	user.channels.create! name: CHANNEL[n]
  end

  Channel.first.users_channels.create! user_id: user_2.id
  Channel.first.users_channels.create! user_id: user_3.id

  40.times do |n|
    user.posts.create title: "Title #{n+1}", image: File.new(Rails.root.join("public/sample.jpg")),
      category: Category.all.sample, channel_id: (Channel.ids << nil).sample
  end
end
