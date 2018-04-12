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

end
