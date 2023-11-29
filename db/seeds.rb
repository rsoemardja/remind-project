# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# require 'cloudinary'
# require 'open-uri'
# require 'faker'


# puts "Cleaning database"
# Note.destroy_all
# Task.destroy_all
# User.destroy_all

# puts "Creating users"
# 10.times do
  # Retrieve the user
#   User.create(
#     email: Faker::Name.first_name + ["@gmail.com", "@hotmail.com", "@yahoo.com"].sample,
#     password: '123456', # Ensure your password has at least 6 characters
#     password_confirmation: '123456',
#     first_name: ["Jonesy", "Jimmy", "John", "Shazza"].sample,
#     last_name: ["Jones", "Johns", "Jim", "Gazza"].sample,
#     phone_number: '04213456789' # Assuming a numeric phone number
#   )
# end

User.create(
  email: "test@test.com",
  password: '123456', # Ensure your password has at least 6 characters
  password_confirmation: '123456',
  first_name: ["Jonesy", "Jimmy", "John", "Shazza"].sample,
  last_name: ["Jones", "Johns", "Jim", "Gazza"].sample,
  phone_number: '04213456789' # Assuming a numeric phone number
)
puts 'user created successfully.'

# reference to the image
file1 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701223984/events-1203275_1280_ivg0xg.jpg")
file2 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701224173/anniversary-157248_1280_hpmnlq.png")
file3 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701224379/boy-1300136_1280_xi5flw.png")
file4 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701224531/school-295210_1280_xpqk9e.png")
file5 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701224638/meeting-1453895_1280_qhjnqt.png")
file6 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701224882/checklist-154274_1280_hyvfla.png")
file7 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701225018/note-34670_1280_gi96pa.png")
file8 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701225129/urgent-160139_1280_oidxms.png")
file9 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701225207/vitamins-26622_1280_nv5mxl.png")
file10 = URI.open("https://res.cloudinary.com/dk0declv9/image/upload/v1701225207/https://res.cloudinary.com/dk0declv9/image/upload/v1701226573/money-4068357_1280_dp7nop.png")

# this is a Sample listing

note2 = Note.new(
  title: 'Party for next month', # Ensure this is a valid title
  category: 'Party', # Ensure this is a valid sport type
  description: " We have party at friend's house", # Ensure this is a valid description
  due_date: Date.today + 1.month,
  completed: false,
  user: User.all.sample

)
note2.photo.attach(io: file2, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
note2.save!

note3 = Note.new(
  title: 'Party for next month', # Ensure this is a valid title
  category: 'Party', # Ensure this is a valid sport type
  description: " We have party at friend's house", # Ensure this is a valid description
  due_date: Date.today + 1.month,
  completed: false,
  user: User.all.sample

)
note3.photo.attach(io: file3, filename: 'boy-1300136_1280_xi5flw.png', content_type: 'image/png')
note3.save!

# note4 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note4.photo.attach(io: file4, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note4.save!

# note5 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note5.photo.attach(io: file5, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note5.save!

# note6 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note6.photo.attach(io: file6, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note6.save!

# note7 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note7.photo.attach(io: file7, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note7.save!

# note8 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note8.photo.attach(io: file8, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note8.save!

# note9 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note9.photo.attach(io: file9, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note9.save!

# note10 = Note.new(
#   title: 'Party for next month', # Ensure this is a valid title
#   category: 'Party', # Ensure this is a valid sport type
#   description: " We have party at friend's house", # Ensure this is a valid description
#   due_date: Date.today + 1.month,
#   completed: false,
#   user: User.all.sample

# )
# note10.photo.attach(io: file10, filename: 'anniversary-157248_1280_hpmnlq.png', content_type: 'image/png')
# note10.save!

# puts 'Notes created successfully.'