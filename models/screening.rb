require_relative("../db/sql_runner.rb")
require_relative("ticket.rb")
require_relative("film.rb")
require_relative("customer.rb")

class Screening

  attr_reader :id
  attr_accessor :title, :showing

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @showing = options['showing']
  end

  def save()
    sql = "INSERT INTO screenings (title, showing) VALUES ($1, $2) RETURNING id;"
    values = [@title, @showing]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def delete()
    sql = "DELETE FROM screenings WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM screenings"
    values = []
    SqlRunner.run(sql, values)
  end

end
