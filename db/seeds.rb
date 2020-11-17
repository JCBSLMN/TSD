# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# image_data = File.read('app/assets/images/bars.jpg')
User.create(email: 'admin@admin.com', password: 'admin1')
User.first.add_role :admin
User.create(email: 'han@fnf.com', password: 'password')
User.create(email: 'frank@transporter.com', password: 'password')
User.create(email: 'bo@dukes.com', password: 'password')
User.create(email: 'michael@krider.com', password: 'password')
User.create(email: 'charlie@ij.com', password: 'password')
User.create(email: 'mike@badboys.com', password: 'password')

Ride.create(user_id: '2', location: 'tokyo', first_name: 'Han', last_name: 'Lue', email: 'han@fnf.com', details: 'do u even drift', duration: '2', cost: '200', image:?)
Ride.create(user_id: '3', location: 'le Medi', first_name: 'Frank', last_name: 'Martin', email: 'frank@transporter.com', details: 'Get trasported.', duration: '1', cost: '50', image:?)
Ride.create(user_id: '4', location: 'Georgia', first_name: 'Bo', last_name: 'Dukes', email: 'bo@dukes.com', details: 'Generally hazardous', duration: '19', cost: '69', image:?)
Ride.create(user_id: '5', location: 'California', first_name: 'Michael', last_name: 'Knight', email: 'michael@krider.com', details: 'My car is kitted out', duration: '2', cost: '200', image:?)
Ride.create(user_id: '6', location: 'Venice', first_name: 'Charlie', last_name: 'Croker', email: 'charlie@ij.com', details: 'I\'m Italian and this is my job', duration: '5', cost: '350', image:?)
Ride.create(user_id: '7', location: 'Miami', first_name: 'Mike', last_name: 'Lowrey', email: 'mike@badboys.com', details: 'for life, duration: '5', cost: '250', image:?)
