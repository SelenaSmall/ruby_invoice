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
    pack_qtys = []
    @order_item.packs(product).each { |p| pack_qtys << [p.qty, p.price] }

    whole_packs = whole_packs(pack_qtys, [], order_qty)

    return whole_packs[0] if whole_packs[1].zero?

    total_packs = left_over_items(pack_qtys, whole_packs[0], whole_packs[1])

    total_packs[0]
  end

  def present_line(whole_packs)
    sub_total = []
    sub_item = []
    whole_packs.each do |k, v, i|
      sub_item << "#{k}x #{v} packs @ #{i} "
      sub_total << k * i
    end

    @line_total = sub_total.inject(0) { |sum, x| sum + x }

    puts "#{@order_qty} #{@order_item.name} #{@line_total}"

    sub_item.each { |s| puts s }
  end

  def total_quantity_of_items
    @line_total
  end

  private

  def whole_packs(pack_qtys, packs, left_over_qty)
    pack_qtys.sort { |a, b| b <=> a }.each do |p, v|
      volume = left_over_qty.to_f / p

      next unless volume >= 1

      left_over_qty -= volume.to_int * p

      packs << [volume.to_int, p, v]
    end

    [packs, left_over_qty]
  end

  def left_over_items(pack_qtys, packs, left_over_qty)
    pack_qtys.sort { |a, b| a <=> b }.each do |p, v|
      break if left_over_qty.zero?

      next unless left_over_qty <= p

      packs.map { |a| a[0] += 1 if a[1].to_i == p }
      left_over_qty = 0

      next if packs.detect { |a| a[1] == p }

      packs << [1, p, v]
    end

    [packs, left_over_qty]
  end
end
