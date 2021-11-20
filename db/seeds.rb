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

user = User.create! email: "bacluong@gmail.com", password: "123123", name: "Bac xa"


4.times do |n|
 	Category.create! name: CATEGORY[n]
end


4.times do |n|
	user.channels.create! name: CHANNEL[n]
end

40.times do |n|
	user.posts.create title: "Title #{n+1}", content: "Content #{n+1}",
	category: Category.all.sample, channel_id: (Channel.ids << nil).sample
end