require './src/book_order'

describe "Book order specs" do
  before(:each) do
    @order = Book_order.new
  end
  
  it "should be have books if we add books" do
    @order.books = [1, 2, 3, 4, 5]
    books = @order.books
    books.should eql [1, 2, 3, 4, 5]
  end
  
  it "should be have name if we add a name" do
    @order.name = "Pepe Gonzalez"
    name = @order.name
    name.should eql "Pepe Gonzalez"
  end
  
  it "should be have address if we add a address" do
    @order.address = "C/ San Vicente 3, P2"
    address = @order.address
    address.should eql "C/ San Vicente 3, P2"
  end
  
  it "should be costs 8 EUR if we add one book" do
    @order.books = [2]
    prize = @order.prize
    prize.should eql 8
  end
end
