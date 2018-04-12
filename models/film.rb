require_relative("../db/sql_runner.rb")
require_relative("ticket.rb")
require_relative("customer.rb")

class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @price = options['price']
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id;"
    values = [@title, @price]
    result = SqlRunner.run(title, price)
    @id = result[0]["id"].to_i
  end

end
