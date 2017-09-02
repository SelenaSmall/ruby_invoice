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
    # get item.pack_sizes
    pack = @order_item.watermelon if product == 'watermelon'

    pack_qtys = []
    pack.each do |p|
      pack_qtys << p.qty
    end

    # sort packs in descending order
    p_desc = pack_qtys.sort { |a, b| b <=> a }

    whole_packs = {}
    left_over_qty = order_qty

    # Find the # of largest size packs required to make up the qty
    # If it's not exact, top it up with next largest packs, etc etc
    p_desc.each do |p|
      volume = left_over_qty.to_f / p

      next unless volume >= 1

      product = volume.to_int * p
      left_over_qty -= product

      whole_packs[p] = volume.to_int
    end

    # sort pack in ascending order
    p_asc = pack_qtys.sort { |a, b| a <=> b }

    p_asc.each do |p|
      break if left_over_qty.zero?

      if left_over_qty <= p
        whole_packs[p] += 1 unless whole_packs[p].nil?
        whole_packs[p] = 1 if whole_packs[p].nil?

        left_over_qty = 0
      end

      next
    end

    puts whole_packs
    whole_packs
  end
end
