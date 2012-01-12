require './src/book_store'

describe "Book Store Specs" do
  before(:each) do
   @book_store = Book_store.new
  end

  it "should be 0 orders if is empty" do
    orders = @book_store.order_list
    orders.size.should eql 0
  end
  
  it "should return nil if add a new order with empty params" do
    order_id = @book_store.new_order([], "", "")
    order_id.should eql nil
    
    order_id = @book_store.new_order([1, 2, 3], "John Doe", "")
    order_id.should eql nil
    
    order_id = @book_store.new_order([1, 2, 3], "", "C// Santo Tomas 25, Valencia")
    order_id.should eql nil
  end
  
  it "should return an object id if add a new valid order" do
    order_id = @book_store.new_order([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")
    order_id.should_not eql nil 
  end
end