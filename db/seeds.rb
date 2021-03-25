# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Laundry.create(name: 'Happy Laundry', city: 'Харків', address: 'пр. Перемоги 45')
Laundry.create(name: 'White Collar', city: 'Київ', address: 'вул. Тарасівська 139')

Customer.create(name: 'Наталія', surname: 'Янковська', phonenumber: '380509637481')
Customer.create(name: 'Тамара', surname: 'Гамбарова', phonenumber: '380503917492')


Worker.create(laundry_id: 1, name: 'Крістіан', surname: 'Бейл', phonenumber: '380674971934')
Worker.create(laundry_id: 2, name: 'Леонардо', surname: 'Ді Капріо', phonenumber: '380962840183')

Size.create(max_load: 6, price: 10)
Size.create(max_load: 8, price: 20)
Size.create(max_load: 12, price: 30)

Mode.create(name: 'Швидке прання', minutes: 60, price: 30)
Mode.create(name: 'Середнє прання', minutes: 120, price: 40)
Mode.create(name: 'Повне прання', minutes: 180, price: 50)


Washer.create(laundry_id: 1, serial_number: '0122313', firm: 'SAMSUNG', model: 'WHP60SF/UA', status: 'працює', number_of_programs: 6, size_id: 1)
Washer.create(laundry_id: 1, serial_number: '0173711', firm: 'Gorenje', model: 'EW6T4R272', status: 'не працює', number_of_programs: 2, size_id: 2)
Washer.create(laundry_id: 2, serial_number: '1239912', firm: 'SAMSUNG', model: 'WHP60SF/UA', status: 'працює', number_of_programs: 4, size_id: 3)


Washing.create(washer_id: 1, customer_id: 1, status: 'Переться', remaining_time: 30, password: 1234)

Service.create(washing_id: 1, mode_id: 1, washing_powder: true, conditioner: false)
