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
TITLE = [
  "Gần 100 bộ đội bắt giữ 4 người vận chuyển 100 bánh heroin",
  "Mẹ chở con 1 tháng tuổi đi từ TP.HCM về quê vì thất nghiệp",
  "Phát hiện 2 người mắc biến chủng Omicron trên chuyến bay từ Singapore",
  "Sập nhà ở TP.HCM, 3 người bị mắc kẹt",
  "MU công bố HLV tạm quyền Ralf Rangnick",
  "Buổi tập đầu tiên của tuyển Thái Lan trước AFF Cup 2020",
  "De Gea vào đội hình hay nhất vòng 13 Premier League",
  "Dựng lều trại, ăn uống từ chiều đến đêm ven sông Hồng ngày cuối tuần",
  "VKS khẳng định thiệt hại 1.900 tỷ, ông Tài nói TP không mất đồng nào",
  "Ducati Panigale V4 đời 2022 có công suất 215,5 mã lực",
  "Ronaldo và tham vọng bất thành ở cuộc đua Quả bóng Vàng",
  "28 ủy viên Trung ương khóa XII nhận quyết định nghỉ hưu"
]

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
    user.posts.create title: TITLE.sample, content: "Content #{n+1}", image: File.new(Rails.root.join("public/sample.jpg")),
      category: Category.all.sample, channel_id: (Channel.ids << nil).sample
  end
end
