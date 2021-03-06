require_relative("../db/sql_runner.rb")
require_relative("customer.rb")
require_relative("film.rb")

class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id;"
    values = [@customer_id, @film_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM tickets WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM tickets"
    values = []
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE tickets SET (customer_id, film_id) = ($1, $2) WHERE id = $3;"
    values = [@customer_id, @film_id, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_films(film_data)
    return film_data.map {|film_hash| Film.new(film_hash)}
  end

  def films()
    sql = "SELECT films.* FROM films INNER JOIN tickets ON films.id = tickets.film_id WHERE tickets.customer_id = $1"
    values = [@id]
    films = SqlRunner.run(sql, values)
    return films.map {|film| Film.new(film)}
  end

  def film()
  sql = "SELECT * FROM films WHERE id = $1"
  values = [@film_id]
  film_hash = SqlRunner.run(sql, values).first()
  return Film.new(film_hash)
end

def customer()
  sql = "SELECT * FROM customers WHERE id = $1"
  values = [@customer_id]
  customer_hash = SqlRunner.run(sql, values).first()
  return Customer.new(customer_hash)
end



end
