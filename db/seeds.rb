# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

u1 = User.create!(name: "Jaisiel Madrid",
				  email: "jaisielms@gmail.com",
				  password: "123456",
				  password_confirmation: "123456",
				  admin: true)

u2 = User.create!(name: "Nacho Peinado",
				  email: "i.peinado.martinez@gmail.com",
				  password: "123456",
				  password: "123456",
				  admin: true)

10.times do |n|
	title = Faker::Lorem.sentence(3)
	body = Faker::Lorem.paragraph(2)
	u1.posts.create!(title: title, body: body)
end

10.times do |n|
	title = Faker::Lorem.sentence(3)
	body = Faker::Lorem.paragraph(2)
	u2.posts.create!(title: title, body: body)
end

99.times do |n|
	name = Faker::Name.name
 	email = Faker::Internet.email
	password = "password"
	User.create!(name: name,
						 				email: email,
							 			password: password,
							 			password_confirmation: password)
 end
