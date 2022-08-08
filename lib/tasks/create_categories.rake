namespace :create_categories do
  desc "Create categories for webapp"
  task create_data: :environment do
    puts "== Starting Create =="
    CATES = ["Thể thao chung", "Giáo dục", "Âm nhạc", "Giải trí", "Công nghệ",
      "Xã hội", "Thế giới", "Sức khỏe", "Du lịch", "Nghệ thuật", "Pháp luật", "Cảm xúc", "Bóng đá"]

    ActiveRecord::Base.transaction do
      CATES.each do |name|
        Category.find_or_create_by! name: name
      end
    end

    puts "== Create successfully =="
  end
end
