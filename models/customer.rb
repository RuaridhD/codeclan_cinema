require_relative("../db/sql_runner.rb")
require_relative("ticket.rb")
require_relative("film.rb")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds'].to_i
    @ticket_count = 0
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id;"
    values = [@name, @funds]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM customers WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE customers SET (name, funds) = ($1, $2) WHERE id = $3;"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_customers(customer_data)
    return customer_data.map {|customer_hash| Customer.new(customer_hash)}
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map {|film| Film.new(film)}
  end

  def ticket_count
    return @ticket_count
  end

  def buy_ticket(film)
    if @funds >= film.price
      @funds -= film.price
      @ticket_count += 1
    else
      return "You can't afford a ticket."
    end
  end

end
