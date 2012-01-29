require './models/order.rb'

describe "Orders specs" do
  it "should be empty data if we add a non valid order" do
    order = Order.new([1, 2, 3], "", "")
    order.books.should eql []
    order.name.should eql nil
    order.address.should eql nil
  end
  
  it "should have the same atributes if we add a order" do
    order = Order.new([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")
    order.books.should eql [1, 2, 3]
    order.name.should eql "John Doe"
    order.address.should eql "C// Santo Tomas 25, Valencia"
  end
  
  it "should have a valid order if we add a valid order" do
    order = Order.new([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")
    order.valid?.should eql true
  end
  
  it "should have a Hash if we convert to it" do
    order = Order.new([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")
    order_hash = order.to_hash
    order_hash.should be_an_instance_of Hash
  end
  
  it "should have a price if we add a valid order" do
    order = Order.new([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")
    order_hash = order.to_hash
    order_hash['price'].should_not eql 0
  end
end