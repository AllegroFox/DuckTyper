# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Colour.destroy_all
Marking.destroy_all
Owner.destroy_all

Colour.create!([{
	name: "Brown",
	hex_colour: "#8B4513"
},
{
	name: "Black",
	hex_colour: "#0D0D0D"
},
{
	name: "White",
	hex_colour: "#F5F5DC"
},
{
	name: "Yellow",
	hex_colour: "#FFE033"
},
{
	name: "Orange",
	hex_colour: "#FF8C00"
},
{
	name: "Green",
	hex_colour: "#228B22"
},
{
	name: "Blue",
	hex_colour: "#191970"
},
{
	name: "Red",
	hex_colour: "#800000"
}])


Marking.create!([{
	name: "Wing Stripes"
},
{
	name: "Hood"
},
{
	name: "Speckles"
},
{
	name: "Eye Spots"
},
{
	name: "Cheek Bars"
},
{
	name: "Eye Stripes"
}])

5.times do |index|
	Owner.create!(name: Faker::Name.name,
				 api_key: Faker::Number.hexadecimal(24))
end	

p "Created #{Colour.count} colours."
p "Created #{Marking.count} markings."
p "Created #{Owner.count} owners."