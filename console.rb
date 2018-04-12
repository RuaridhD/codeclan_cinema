require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')

# Customer.delete_all()
# Film.delete_all()
# Ticket.delete_all()

customer1 = Customer.new({'name' => 'Ruaridh Dunbar', 'funds' => 100})
# user1.save()

film1 = Film.new({'title' => 'Pacific Rim: Uprising', 'price' => '10'})
# film1.save()
film2 = Film.new({'title' => 'Tomb Raider', 'price' => '8'})
# film2.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
#ticket1.save()
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
#ticket2.save()

binding.pry
nil
