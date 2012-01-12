class Book_store
  
  def initilize
    
  end
  
  def new_order(books, name, address)
    if books.empty? || name == "" || address == ""
      return nil
    else
      return 1
    end
  end
  
  def order_list
    return []
  end
end
