require './src/price_calculation'

class Order
  attr_accessor :books
  attr_accessor :name
  attr_accessor :address
  
  def initialize(books, name, address)
    @books = []
    if valid?(books, name, address)
      @books = books
      @name = name
      @address = address
    end
  end
  
  def to_hash
    result = Hash.new
    result['books'] = books
    result['name'] = name
    result['address'] = address
    result['price'] = get_price
    return result
  end

  def valid?(books = @books, name = @name, address = @address)
    if books.empty? || name == "" || address == ""
      return false
    else
      return true
    end
  end
  
  private
  
  def get_price
    @price_calc = PriceCalculation.new if @price_calc.nil?
    return @price_calc.price(books)
  end
end