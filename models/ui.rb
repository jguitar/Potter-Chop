class OrderUI
 
  def initialize
    option = print_menu
    do_menu(option)
  end
  
  def do_menu(option)
    case option
    when "1"
      enter_order
    when "2"
      print_orders
    when "q"
      quit
    else
      enter_a_valid_option
    end
  end
  
  def enter_a_valid_option
    puts "You have not press a valid key."
  end
  
  def enter_order
    puts "Entering a order..."
  end
  
  def print_menu
    system("clear")
    title = "Order application"
    puts title
    puts "-" * title.size
    puts "\n"
    puts "(1) Enter a order "
    puts "(2) Print orders"
    puts "(q) Quit"
    
    return gets.chomp
  end
  
  def print_orders
    puts "Printing orders..."
  end
  
  def quit
    puts "Thanks for using the application"
  end
end

ui = OrderUI.new


