# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'cloudinary'
require 'open-uri'
# require 'faker'

puts "Cleaning database"
# Note.destroy_all
# Task.destroy_all
User.destroy_all

User.create(
  email: "jimmy@mail.com",
  password: '123456', # Ensure your password has at least 6 characters
  password_confirmation: '123456',
  first_name: "Jimmy",
  last_name: "Jones",
  phone_number: 142_134_567_8 # Assuming a numeric phone number
)
puts 'user created successfully.'

# reference to the image
file1 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1701301917/anniversary_j0sbqk.png")
file2 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1701301917/Family-Photo_fistvr.png")
file3 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1701401356/Relaxing_in_a_Park_Bench_ay0dfw.jpg")
file4 = URI.open("https://res.cloudinary.com/dttxk4mnc/image/upload/v1701402622/Stressed_Remote_Worker_1_uzcba3.jpg")

note = Note.new(
  title: 'Party for next month', # Ensure this is a valid title
  category: 'Party', # Ensure this is a valid sport type
  description: " We have party at friend's house", # Ensure this is a valid description
  due_date: Date.today + 1.month,
  user: User.all.sample
)
note.photos.attach(io: file1, filename: 'anniversary.png', content_type: 'image/png')
if note.save
  puts 'Note created successfully.'
else
  puts "Note failed to save. Errors: #{note.errors.full_messages.join(", ")}"
end

note2 = Note.new(
  title: 'We have can walk around the park', # Ensure this is a valid title
  category: 'Party', # Ensure this is a valid sport type
  description: " We can relax at the park", # Ensure this is a valid description
  due_date: Date.today + 1.month,
  user: User.all.sample
)
note2.photos.attach(io: file3, filename: 'anniversary.png', content_type: 'image/png')
if note.save
  puts 'Note created successfully.'
else
  puts "Note failed to save. Errors: #{note2.errors.full_messages.join(", ")}"
end

task = Task.new(
  title: 'Party for next month', # Ensure this is a valid title
  category: 'Party', # Ensure this is a valid sport type
  description: " We have party at friend's house", # Ensure this is a valid description
  due_date: Date.today + 1.month,
  user: User.all.sample
)
task.photos.attach(io: file2, filename: 'family-photo.png', content_type: 'image/png')
if task.save
  puts 'Task created successfully.'
else
  puts "Task failed to save. Errors: #{task.errors.full_messages.join(", ")}"
end

task2 = Task.new(
  title: 'We Have a Mid Demo', # Ensure this is a valid title
  category: 'Party', # Ensure this is a valid sport type
  description: " We have a Mid Demo at Inspire 9", # Ensure this is a valid description
  due_date: Date.today + 1.month,
  user: User.all.sample
)
task2.photos.attach(io: file4, filename: 'stressed.png', content_type: 'image/png')
if task2.save
  puts 'Task created successfully.'
else
  puts "Task failed to save. Errors: #{task2.errors.full_messages.join(", ")}"
end
