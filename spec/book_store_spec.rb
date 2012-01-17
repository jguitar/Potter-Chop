require './src/book_store'

module BookStoreSpecHelper
  def add_valid_order(book_store)
    order_id = book_store.new_order([1, 2, 3], "John Doe", "C// Santo Tomas 25, Valencia")  
  end
end

describe "Book Store Specs" do
  include BookStoreSpecHelper
  
  before(:each) do
   @book_store = Book_store.new
   @book_store.clear_database
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
    order_id = add_valid_order(@book_store)
    order_id.should_not eql nil
  end
  
  it "should list a order if add a new valid order" do
    add_valid_order(@book_store)
    expected_orders = @book_store.order_list
    expected_orders.length.should eql 1
  end
  
  it "should be 0 orders if clear the database" do
    add_valid_order(@book_store)
    @book_store.clear_database
    
    orders = @book_store.order_list
    orders.size.should eql 0
  end
end