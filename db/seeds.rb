# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.create(email: 'harshith.keni@gmail.com', password: 'abc123')
u2 = User.create(email: 'harshith.keni@sdstate.edu', password: 'abc123')

List.create(user:u1, title:'List 1', description: 'list 1')
List.create(user:u1, title:'List 2', description: 'list 2')
List.create(user:u1, title:'List 3', description: 'list 3')
