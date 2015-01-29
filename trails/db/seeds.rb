# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

User.create(name: 'Matt Cho',
	email: 'mattcho@email.com',
	city: 'Washington',
	state: 'DC',
	zipcode: '20001',
	password_digest: '12345',
	latitude: '39.760000',
	longitude: '-105.020089')
