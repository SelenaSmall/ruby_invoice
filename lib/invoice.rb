# Invoice class
class Invoice
  def print_order(order)
    puts "Customer Invoice \n"
    puts "Items rounded up to nearest available qty\n"
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
