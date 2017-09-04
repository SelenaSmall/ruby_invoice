# Invoice class
class Invoice
  # Print order method
  # @param order [Order]
  # @return nil
  def print_order(order)
    puts "CUSTOMER INVOICE \n"
    puts "qty\titem\t\t\tsub"
    puts '-------------------------------------'
    order.items.each do |item|
      puts "#{item[0].order_qty} #{item[0].order_item.name} \t\t\t#{item[0].presenter_line_total}"
      item[1].each { |i| puts "\t#{i}\n" }
    end
    puts '-------------------------------------'
    puts "TOTAL \t\t\t\t#{order.find_order_total} \n\n"
  end
end
