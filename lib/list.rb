# List class
class List
  def selection
    puts "Products Available \n"

    puts 'Watermelons'
    Item.new('watermelons').packs('watermelons').each do |i|
      puts "#{i.qty} pack @ #{i.price}"
    end
    puts "---------------\n"

    puts 'Pineapples'
    Item.new('pineapples').packs('pineapples').each do |i|
      puts "#{i.qty} pack @ #{i.price}"
    end
    puts "---------------\n"

    puts 'Rockmelons'
    Item.new('rockmelons').packs('rockmelons').each do |i|
      puts "#{i.qty} pack @ #{i.price}"
    end
    puts "---------------\n"
  end
end
