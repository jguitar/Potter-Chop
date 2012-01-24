require './src/order_database'
require './src/order'

describe "Order database specs" do
  
  before(:each) do
    @db = OrderDatabase.new
  end
  
  it "should be empty orders collection if we clean database" do
    @db.clear
    orders_coll = @db.get_orders
    orders_coll.count.should eql 0
  end
  
  it "should get one if we add one" do
    order = Order.new([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")
    @db.clear
    @db.insert(order.to_hash)
    orders_coll = @db.get_orders
    orders_coll.count.should eql 1
  end
end
