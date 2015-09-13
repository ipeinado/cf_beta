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
					twitter: "homelessfonts",
					facebook: "https://www.facebook.com/homelessfonts",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'Homelessfonts_LOGO.png'))
)

Project.create!(title: "joyners",
					address: "Calle Calàbria 169",
					city: "Barcelona",
					province: "Barcelona",
					country: "Spain",
					description: "¡Comparte piso con séniors afines, divide gastos y disfruta de tu etapa adulta mientras accedes a múltiples servicios!",
					website: "http://www.joyners.es/",
					twitter: "somosjoyners",
					facebook: "https://www.facebook.com/pages/Joyners/1537823113160952",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'Joiners_LOGO.jpeg'))
					)
Project.create!(title: "Accessible.info",
					address: "Calle Madres de la Plaza de Mayo, 44, 31013",
					logo: "AccesibleInfo_LOGO.png",
					city: "Artica",
					province: "Navarra",
					country: "Spain",
					description: "Buscador de lugares accesibles con información del lugar, fotos... Sitios accesibles para mascotas. Auditorias para obtener grado de accesibilidad A, B , C.",
					website: "http://www.accessible.info/",
					twitter: "accessible_info",
					facebook: "https://www.facebook.com/accesible.paratodos",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'AccesibleInfo_LOGO.png'))
					)
Project.create!(title: "Inrex Home Care, LLC",
					address: "415 W. Schrock Rd.",
					city: "Westerville",
					province: "Ohio",
					country: "USA",
					description: "INREX Home Care, LLC is committed to providing the highest quality of services and support to our community members with physical and developmental disabilities by helping them live their lives to their fullest potential",
					website: "http://www.inrexhomecare.com",
					twitter: "InrexHomeCare",
					facebook: "https://www.facebook.com/pages/Inrex-Home-Care-LLC/1537934039754844",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'InrexHomeCare_LOGO.jpg'))
					)
Project.create!(title: "VecineoApp",
					city: "Murcia",
					province: "Murcia",
					country: "España",
					description: "Ofrece tus servicios a tus vecinos y encuentra ofertas con nuestra App. Vecineo, tu vida en una milla",
					website: "http://www.vecineo.com/",
					twitter: "VecineoApp",
					facebook: "https://www.facebook.com/Vecineo",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'VecineoAPP_LOGO.png'))
					)
Project.create!(title: "BCN ACCESSTOUR",
					city: "Barcelona",
					province: "Barcelona",
					country: "España",
					description: "Inbound Tour Operator specialized in #accessibletourism in #Spain. #accessibleholidays for special needs families, senior and PRM.",
					website: "http://www.bcnaccestour.com/",
					twitter: "bcnaccestour",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'BCNAccessTour_LOGO.jpeg'))
					)
Project.create!(title: "Ciudad Fácil",
					city: "Valdivia",
					province: "Santiago de Chile",
					country: "Chile",
					description: "Aplicación móvil inclusiva, para que todos disfrutemos de la ciudad. ¿Te unes en esta aventura :D? Beta disponible en playstore!",
					website: "http://ciudadfacil.cl/",
					twitter: "ciudadFacil",
					facebook: "https://www.facebook.com/ciudadFacil.cl",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'CiudadFacil_LOGO.jpg'))
					)
Project.create!(title: "encicle",
					address: "C/ Zapateros, 8",
					city: "Valencia",
					province: "Valencia",
					country: "España",
					description: "Somos una empresa de bicimensajeros valenciana comprometida con las necesidades de nuestra ciudad de una forma sostenible, eficaz y respetuosa.",
					website: "http://www.enciclebicimensajeros.com/",
					twitter: "encicle",
					facebook: "https://www.facebook.com/enciclebicimensajeros",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'Encicle_LOGO.jpg'))
					)
Project.create!(title: "Mi Huerto Web",
					city: "Huellelhue",
					province: "Osorno",
					country: "Chile",
					description: "Agricultura sustentable, comercio justo e inclusivo. La nueva manera de obtener tus productos del campo, colaborando directamente con la agricultura familiar campesina.",
					website: "http://mihuertoweb.cl/",
					twitter: "MiHuertoWeb",
					facebook: "https://www.facebook.com/MiHuertoWeb",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'MiHuertoWeb_LOGO.jpg'))
					)
Project.create!(title: "Huerta Montecarmelo",
					address: "Monasterio de las Huelgas, 15",
					city: "Madrid",
					province: "Madrid",
					country: "España",
					description: "huertos urbanos en pleno Madrid, con trabajadores con discapacidad intelectual",
					website: "http://www.lahuertademontecarmelo.com/",
					twitter: "HuertaMtcarmelo",
					facebook: "https://www.facebook.com/LaHuertaDeMontecarmelo",
					logo: File.open(File.join(Rails.root.join('public/uploads/projects'), 'HuertaMontecarmelo_LOGO.jpg'))
					)
Project.create!(title: "@Trazeo",
					city: "Córdoba",
					province: "Córdoba",
					country: "España",
					description: "Un nuevo transporte escolar que funciona con el motor de los pies. Convierte las calles en espacios más amables uniendo movilidad infantil y tecnología.",
					website: "http://trazeo.es/",
					twitter: "Trazeo",
					facebook: "https://www.facebook.com/trazeo"
					)

Promo.create!(name: "Balsamiq",
  brief_product_description: "Cloud-based version of Balsamiq mockups",
  brief_promo_description: "3 months free of Balsamiq",
  long_product_description: "Balsamiq is the maker of Mockups, the rapid wireframing software that combines the simplicity of paper sketching with the power of a digital tool so that teams can focus on what's important. We're a fast-growing, but small and personable company that competes on usability and service. We believe work should be fun, and that life is too short for bad software.",
	about_the_promo: "3 months free extended trial of myBalsamiq with full functionality. The offer applies on new myBalsamiq accounts only and cannot be used towards existing accounts.",
  twitter: "http://twitter.com/balsamiq",
  facebook: "http://facebook.com/balsamiq",
  website: "http://balsamiq.com"
  )

Promo.create!(name: "Trello Gold",
  brief_product_description: "Trello is the free, flexible, and visual way to organize anything with anyone.",
  brief_promo_description: "3 FREE months of Trello Gold!",
  long_product_description: "Drop the lengthy email threads, out-of-date spreadsheets, no-longer-so-sticky notes, and clunky software for managing your projects. Trello lets you see everything about your project in a single glance.",
	about_the_promo: "Get a $15 discount on Trello Gold",
  twitter: "http://twitter.com/trello",
  facebook: "https://www.facebook.com/trelloapp",
  website: "https://trello.com/"
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
