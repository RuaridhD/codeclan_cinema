require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')
require_relative('models/screening.rb')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()

customer1 = Customer.new({'name' => 'Ruaridh Dunbar', 'funds' => 100})
customer1.save()
customer2 = Customer.new({'name' => 'Max Power', 'funds' => 10000})
customer2.save()


film1 = Film.new({'title' => 'Pacific Rim Uprising', 'price' => 10})
film1.save()
film2 = Film.new({'title' => 'Tomb Raider', 'price' => 8})
film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3.save()

screening1 = Screening.new({'title' => film1.title, 'showing' => '15/04/18 21:00'})
screening1.save()
screening2 = Screening.new({'title' => film2.title, 'showing' => '15/04/18 19:30'})
screening2.save()

binding.pry
nil
