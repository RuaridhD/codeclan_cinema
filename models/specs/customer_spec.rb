require("minitest/autorun")
require("minitest/rg")

require_relative('../customer.rb')
require_relative('../film.rb')
require_relative('../ticket.rb')

class CustomerTest < MiniTest::Test

  def setup()
    @customer1 = Customer.new({'name' => 'Ruaridh Dunbar', 'funds' => 100})
    @film1 = Film.new({'title' => 'Pacific Rim Uprising', 'price' => 10})
    @film2 = Film.new({'title' => 'Tomb Raider', 'price' => 8})
  end

  def test_ticket_count
    assert_equal(0, @customer1.ticket_count)
  end


  def test_buy_ticket()
    @customer1.buy_ticket(@film1)
    assert_equal(90, @customer1.funds)
  end

  def test_buy_ticket__how_many
   @customer1.buy_ticket(@film1)
   @customer1.buy_ticket(@film2)
   assert_equal(2, @customer1.ticket_count)
 end

end
