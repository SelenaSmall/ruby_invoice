require_relative 'item'

# OrderLine class
class OrderLine
  attr_reader :order_qty, :order_item, :order_packs

  def initialize(order_qty, order_item)
    @order_qty = order_qty
    @order_item = order_item
    @order_packs = nil
  end

  def optimal(product)
    pack = @order_item.packs(product)
    # pack = @order_item.watermelon if product == 'watermelon'

    pack_qtys = []
    pack.each do |p|
      pack_qtys << [p.qty, p.price]
    end

    # sort packs in descending order
    p_desc = pack_qtys.sort { |a, b| b <=> a }

    whole_packs = []
    left_over_qty = order_qty

    # Find the # of largest size packs required to make up the qty
    # If it's not exact, top it up with next largest packs, etc etc
    p_desc.each do |p, v|
      volume = left_over_qty.to_f / p

      next unless volume >= 1

      product = volume.to_int * p
      left_over_qty -= product

      whole_packs << [volume.to_int, p, v]
    end
    # puts whole_packs.each

    # sort pack in ascending order
    p_asc = pack_qtys.sort { |a, b| a <=> b }

    p_asc.each do |p, v|
      break if left_over_qty.zero?

      if left_over_qty <= p
        # Update qty of packs if entry already exists
        whole_packs.map do |a|
          a[0] += 1 if a[1].to_i == p
          left_over_qty = 0
        end

        next if whole_packs.detect { |a| a[1] == p }
        # Otherwise, add a new entry to make up the qty
        whole_packs << [1, p, v]
      end

      next
    end

    whole_packs
  end

  def present_line(whole_packs)
    sub_total = []
    sub_item = []
    whole_packs.each do |k, v, i|
      sub_item << "#{k}x #{v} packs @ #{i} "
      sub_total << k * i
    end

    total = sub_total.inject(0) { |sum, x| sum + x }

    puts "#{@order_qty} #{@order_item.name} #{total}"

    sub_item.each do |s|
      puts s
    end
  end
end
