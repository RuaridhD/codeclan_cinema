require_relative("../db/sql_runner.rb")
require_relative("customer.rb")
require_relative("film.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end
