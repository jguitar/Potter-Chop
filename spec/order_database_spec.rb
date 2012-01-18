require './src/order_database'

describe "Order database specs" do
  
  before(:each) do
    @db = OrderDatabase.new
  end
  
  it "should get an object if we get orders" do
    orders = @db.get_orders
    orders.should_not eql nil
  end
end
