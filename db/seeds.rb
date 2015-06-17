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
					logo: "AccesibleInfo_LOGO.png",
					city: "Artica",
					province: "Navarra",
					country: "Spain",
					description: "Buscador de lugares accesibles con información del lugar, fotos... Sitios accesibles para mascotas. Auditorias para obtener grado de accesibilidad A, B , C.",
					website: "http://www.accessible.info/",
					twitter: "accessible_info"
					)
Project.create!(title: "Inrex Home Care, LLC",
					address: "415 W. Schrock Rd.",
					city: "Westerville",
					province: "Ohio",
					country: "USA",
					description: "INREX Home Care, LLC is committed to providing the highest quality of services and support to our community members with physical and developmental disabilities by helping them live their lives to their fullest potential",
					website: "http://www.inrexhomecare.com",
					twitter: "InrexHomeCare"
					)
Project.create!(title: "VecineoApp",
					city: "Murcia",
					province: "Murcia",
					country: "España",
					description: "Ofrece tus servicios a tus vecinos y encuentra ofertas con nuestra App. Vecineo, tu vida en una milla",
					website: "http://www.vecineo.com/",
					twitter: "VecineoApp"
					)
Project.create!(title: "BCN ACCESSTOUR",
					city: "Barcelona",
					province: "Barcelona",
					country: "España",
					description: "Inbound Tour Operator specialized in #accessibletourism in #Spain. #accessibleholidays for special needs families, senior and PRM.",
					website: "http://www.bcnaccestour.com/",
					twitter: "bcnaccestour"
					)
Project.create!(title: "Ciudad Fácil",
					city: "Valdivia",
					province: "Santiago de Chile",
					country: "Chile",
					description: "Aplicación móvil inclusiva, para que todos disfrutemos de la ciudad. ¿Te unes en esta aventura :D? Beta disponible en playstore!",
					website: "http://ciudadfacil.cl/",
					twitter: "ciudadFacil"
					)
Project.create!(title: "encicle",
					address: "C/ Zapateros, 8",
					city: "Valencia",
					province: "Valencia",
					country: "España",
					description: "Somos una empresa de bicimensajeros valenciana comprometida con las necesidades de nuestra ciudad de una forma sostenible, eficaz y respetuosa.",
					website: "http://www.enciclebicimensajeros.com/",
					twitter: "encicle"
					)
Project.create!(title: "Mi Huerto Web",
					city: "Huellelhue",
					province: "Osorno",
					country: "Chile",
					description: "Agricultura sustentable, comercio justo e inclusivo. La nueva manera de obtener tus productos del campo, colaborando directamente con la agricultura familiar campesina.",
					website: "http://mihuertoweb.cl/",
					twitter: "MiHuertoWeb"
					)
Project.create!(title: "Huerta Montecarmelo",
					address: "Monasterio de las Huelgas, 15",
					city: "Madrid",
					province: "Madrid",
					country: "España",
					description: "huertos urbanos en pleno Madrid, con trabajadores con discapacidad intelectual",
					website: "http://www.lahuertademontecarmelo.com/",
					twitter: "HuertaMtcarmelo"
					)
Project.create!(title: "@Trazeo",
					city: "Córdoba",
					province: "Córdoba",
					country: "España",
					description: "Un nuevo transporte escolar que funciona con el motor de los pies. Convierte las calles en espacios más amables uniendo movilidad infantil y tecnología.",
					website: "http://trazeo.es/",
					twitter: "Trazeo"
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
