# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


pols =
 ['Mike Chenault',
  'Ray Metcalfe',
  'Berta Gardner',
  'Bill Walker',
  'Pete Kelly',
  'Mike Dunleavy',
  'Vince Beltrami',
  'Jeff Landfield',
  'Amy Demobski',
  'Don Young',
  'Lisa Murkowski',
  'Mark Begich',
  'Mayor Dan Sullivan',
  'Ethan Berkowitz',
  'Dustin Darden',
  'Les Gara',
  'Sarah Palin',
  'Joe Miller',
  'Senator Dan Sullivan',
  'Forrest Dunbar'
]

pols.each do |pol|
  Character.create!(character_name: pol)
end

Category.create!(category_name: 'smarter', super: 'smartest')
Category.create!(category_name: 'sexier', super: 'sexiest')
Category.create!(category_name: 'sleazier', super: 'sleaziest')
Category.create!(category_name: 'cooler', super: 'coolest')
Category.create!(category_name: 'more corrupt', super: 'most corrupt')
Category.create!(category_name: 'more charmismatic', super: 'most charmismatic')
Category.create!(category_name: 'more obnoxious', super: 'most obnoxious')
