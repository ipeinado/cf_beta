# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: "Jaisiel Madrid",
				  email: "jaisielms@gmail.com",
				  password: "123456",
				  password_confirmation: "123456",
				  admin: true)

User.create!(name: "Nacho Peinado",
				  email: "i.peinado.martinez@gmail.com",
				  password: "123456",
				  password: "123456",
				  admin: true)
Project.create!(title: "Homelessfonts",
					address: "Riereta 24",
					city: "Barcelona",
					province: "Barcelona",
					country: "Spain",
					description: "Homelessfonts is an Arrels Foundation initiative which consists of creating a collection of typefaces based on the handwriting of homeless",
					website: "http://www.homelessfonts.org/",
					twitter: "homelessfonts"
					)
Project.create!(title: "joyners",
					address: "Calle Calàbria 169",
					city: "Barcelona",
					province: "Barcelona",
					country: "Spain",
					description: "¡Comparte piso con séniors afines, divide gastos y disfruta de tu etapa adulta mientras accedes a múltiples servicios!",
					website: "http://www.joyners.es/",
					twitter: "somosjoyners"
					)
Project.create!(title: "Accessible.info",
					address: "Calle Madres de la Plaza de Mayo, 44, 31013",
					city: "Artica",
					province: "Navarra",
					country: "Spain",
					description: "Buscador de lugares accesibles con información del lugar, fotos... Sitios accesibles para mascotas. Auditorias para obtener grado de accesibilidad A, B , C.",
					website: "http://www.accessible.info/",
					twitter: "accessible_info"
					)
Project.create!(title: "Inrex Home Care, LLC",
					address: "415 W. Schrock Rd.",
					city: "Westerville,",
					province: "Ohio",
					country: "USA",
					description: "INREX Home Care, LLC is committed to providing the highest quality of services and support to our community members with physical and developmental disabilities by helping them live their lives to their fullest potential",
					website: "http://www.inrexhomecare.com",
					twitter: "InrexHomeCare"
					)
# 99.times do |n|
#	name = Faker::Name.name
#	email = Faker::Internet.email
#	password = "password"
#	User.create!(name: name,
#							 email: email,
#							 password: password,
#							 password_confirmation: password)
# end
