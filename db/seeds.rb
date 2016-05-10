# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'roo'

jaisiel = User.create!(name: "Jaisiel Madrid",
				  email: "jaisielms@gmail.com",
				  password: "123456",
				  password_confirmation: "123456",
				  admin: true)

nacho = User.create!(name: "Nacho Peinado",
				  email: "i.peinado.martinez@gmail.com",
				  password: "123456",
				  password_confirmation: "123456",
				  admin: true)

projects = Roo::Spreadsheet.open('public/seeds/proyectos_emprendeaqui.xlsx')
p projects.info
projects.each_row_streaming(offset: 1, pad_cells: true) do |row|
	p = Project.new
	p.title = (row[0].nil? ? "" : row[0].value)
	p.description = (row[1].nil? ? "" : row[1].value)
	p.address = (row[2].nil? ? "" : row[2].value)
	p.city = (row[3].nil? ? "" : row[3].value)
	p.province = (row[4].nil? ? "" : row[4].value)
	p.country = (row[5].nil? ? "" : row[5].value)
	p.twitter = (row[6].nil? ? "" : row[6].value)
	p.website = (row[7].nil? ? "" : row[7].value)
	p.logo = File.open(Rails.root.join("public/seeds/projects/logos").join(row[8].value)) unless row[8].nil?
	p.featured_picture = File.open(Rails.root.join("public/seeds/projects/featured_pictures").join(row[9].value)) unless row[9].nil?

	p.save
	sleep 0.1
end

balsamiq = Promo.create!(name: "Balsamiq",
  brief_product_description: "Cloud-based version of Balsamiq mockups",
  brief_promo_description: "3 months free of Balsamiq",
  long_product_description: "Balsamiq is the maker of Mockups, the rapid wireframing software that combines the simplicity of paper sketching with the power of a digital tool so that teams can focus on what's important. We're a fast-growing, but small and personable company that competes on usability and service. We believe work should be fun, and that life is too short for bad software.",
	about_the_promo: "3 months free extended trial of myBalsamiq with full functionality. The offer applies on new myBalsamiq accounts only and cannot be used towards existing accounts.",
  twitter: "http://twitter.com/balsamiq",
  facebook: "http://facebook.com/balsamiq",
  website: "http://balsamiq.com",
	remote_promo_logo_url: "https://s3.eu-central-1.amazonaws.com/cfbeta/uploads/promo/promo_logo/1/Balsamiq_LOGO.png",
	remote_promo_featured_picture_url: "https://s3.eu-central-1.amazonaws.com/cfbeta/uploads/promo/promo_featured_picture/1/Balsamic_ImagenDestacada_Cuerpo.jpg.png",
	region: "Global",
	link: "https://balsamiq.com/download/"
  )

w = Category.create!(name: "Web")

balsamiq.categories.create(name: "Diseño")
balsamiq.categories << w

trello = Promo.create!(name: "Trello Gold",
  brief_product_description: "Trello is the free, flexible, and visual way to organize anything with anyone.",
  brief_promo_description: "3 FREE months of Trello Gold!",
  long_product_description: "Drop the lengthy email threads, out-of-date spreadsheets, no-longer-so-sticky notes, and clunky software for managing your projects. Trello lets you see everything about your project in a single glance.",
	about_the_promo: "Get a $15 discount on Trello Gold",
  twitter: "http://twitter.com/trello",
  facebook: "https://www.facebook.com/trelloapp",
  website: "https://trello.com/",
	remote_promo_logo_url: "https://s3.eu-central-1.amazonaws.com/cfbeta/uploads/promo/promo_logo/2/Trello_LOGO.png",
	region: "Global",
	link: "https://trello.com/signup"
)

trello.categories.create(name: "Project management")
trello.categories << w

@venue = Venue.create!(
  name: "Spinosa",
  website: "http://www.spinosaboards.com/es/",
  twitter: "spinosacenter",
  facebook: "https://www.facebook.com/SpinosaCenter/",
  address: "Avenida Radiobaliza Oscar, 2",
  city: "Los Alcázares",
  province: "Murcia",
  country: "España",
	phone: "+34 968 584929",
  accessibility: "Lugar totalmente accesible, con rampas para sillas de ruedas")

@venue.events.create!(title: "Closefunding October Meeting",
																	short_description: "Regular catch-up meeting, October edition",
																	long_description: "Esta reunión ya se celebró en Octubre",
																	daytime: Time.zone.local(2015, 10, 15, 10)
																	)

march_meeting = @venue.events.create!(title: "Closefunding March Meeting",
																short_description: "Reunión regular para ponernos al día, edición de Marzo",
																long_description: "Estáis todos invitados a la reunión de Marzo de Closefunding",
																daytime: Time.zone.local(2016, 3, 10, 10)
																)
march_meeting.tag_list.add("closefunding", "business")
march_meeting.save

april_meeting = @venue.events.create!(title: "Closefunding April Meeting",
																short_description: "Reunión regular para ponernos al día, edición de Abril",
																long_description: "Estáis todos invitados a la reunión de Abril de Closefunding",
																daytime: Time.zone.local(2016, 4, 10, 10)
																)
april_meeting.tag_list.add("closefunding" , "networking")
april_meeting.save

march_meeting.organizers << jaisiel
march_meeting.organizers << nacho

april_meeting.organizers << jaisiel

closefunding = Entity.create!(
	name: "Closefunding",
	twitter: "https://twitter.com/closefunding",
	facebook: "https://www.facebook.com/pages/Closefunding/796245717111990",
	website: "http://closefunding.es",
	bio: "La primera plataforma social de emprendimiento inclusivo y colaborativo de proximidad. Impulsando el desarrollo de comunidades de emprendimiento local.",
	city: "Los Alcázares"
)

march_meeting.entities << closefunding


50.times do |n|
	name = Faker::Company.name
	entity_logo= Faker::Company.logo
	bio = Faker::Company.catch_phrase
	city = Faker::Address.city
	website = Faker::Internet.url
	manifest_support = Faker::Boolean.boolean

	Entity.create!(name: name, entity_logo: entity_logo, bio: bio, city: city, website: website, manifest_support: manifest_support)
end

# 99.times do |n|
#	name = Faker::Name.name
#	email = Faker::Internet.email
#	password = "password"
#	User.create!(name: name,
#							 email: email,
#							 password: password,
#							 password_confirmation: password)
# end
