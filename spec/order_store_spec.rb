require './src/order_store'
require './src/order_database'

module OrderStoreSpecHelper
  def add_valid_order(order_store)
    order_id = order_store.new_order([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")  
  end
end

describe "Order Store Specs" do
  include OrderStoreSpecHelper
  
  before(:each) do
   @db = OrderDatabase.new if @db.nil?
   @db.clear
   @order_store = OrderStore.new
  end

  it "should be 0 orders if is empty" do
    orders = @order_store.order_list
    orders.size.should eql 0
  end
  
  it "should return nil if add a new order with empty params" do
    order_id = @order_store.new_order([], "", "")
    order_id.should eql nil
    
    order_id = @order_store.new_order([1, 2, 3], "John Doe", "")
    order_id.should eql nil
    
    order_id = @order_store.new_order([1, 2, 3], "", "C// Santo Tomas 25, Valencia")
    order_id.should eql nil
  end
  
  it "should return an object id if add a new valid order" do
    order_id = add_valid_order(@order_store)
    order_id.should_not eql nil
  end
  
  it "should list a order if add a new valid order" do
    add_valid_order(@order_store)
    expected_orders = @order_store.order_list
    expected_orders.length.should eql 1
  end
end