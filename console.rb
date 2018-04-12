require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/ticket.rb')

require('pry-byebug')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()

user1 = User.new({'name' => 'Ruaridh Dunbar', 'funds' => 100})
# user1.save()


binding.pry
nil
