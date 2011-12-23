require './src/shopping_basquet'

class Book_order
  attr_accessor :books
  attr_accessor :name
  attr_accessor :address
  
  def prize
    basquet = Shopping_basquet.new
    return basquet.prize(@books)
  end
end