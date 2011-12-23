require './src/db_connection'
require './src/order_db'

describe "Order database specs" do
  before(:each) do
    @order = Order_db.new(Db_connection.new)
  end
  
  it "should needs a db connection if create a class" do
    @order.should_not eql nil
  end
end