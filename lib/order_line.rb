require_relative 'item'

# OrderLine class
class OrderLine
  attr_reader :order_qty, :order_item, :order_packs

  def initialize(order_qty, order_item)
    @order_qty = order_qty
    @order_item = order_item
    @order_packs = nil
  end

  # Optimal method
  # @param product [String]
  # @return Enumerator
  def optimal(product)
    pack_qtys = []
    @order_item.packs(product).each { |p| pack_qtys << [p.qty, p.price] }

    # Retrive matches for same size packs
    same_packs = price_check(same_match(pack_qtys, []), [])

    # Retrive matches for different size packs
    diff_packs = price_check(diff_match(pack_qtys, [], []), [])

    calculate_best(same_packs, diff_packs)
  end

  # Calculate best method
  # @param same_packs [Enumerator]
  # @param diff_packs [Enumerator]
  # @return optimum combo of packs [Enumerator]
  def calculate_best(same_packs, diff_packs)
    return diff_packs unless same_packs.any?

    return same_packs unless diff_packs.any?

    # Get the total price of diff_packs
    sub_total = []
    diff_packs.each { |_x, _y, _z, val| sub_total << val }

    line_total = sub_total.inject(:+)

    # Return the cheapest option
    return diff_packs if [same_packs.min[3], line_total].min == line_total

    same_packs
  end

  # Present line method
  # @param packs [Array]
  # @return Array
  def present_line(packs)
    sub_total = []
    sub_item = []
    packs.each do |k, v, i|
      sub_total << k * i
      sub_item << "#{k}x #{v} packs @ #{i}"
    end

    @line_total = sub_total.inject(:+)

    sub_item.each { |s| s }
  end

  # Presenter line total method
  # @return line_total
  def presenter_line_total
    @line_total
  end

  private

  # Price check method
  # @param exact_matches [Array]
  # @param prices [Array]
  # @return prices [Enumerator]
  def price_check(matches, prices)
    matches.each do |x, y, z|
      val = (x * z)

      prices << [x, y, z, val]
    end

    prices.select { |x| x[3] }.map
  end

  # Exact match method
  # @param pack_qtys [Array]
  # @param matches [Array]
  # @param order_qty [Integer]
  # @return matches
  def same_match(pack_qtys, matches)
    pack_qtys.sort { |a, b| b <=> a }.each do |p, v|
      next unless (order_qty / p) * p == order_qty
      matches << [order_qty / p, p, v]
      break
    end

    matches
  end

  # Exact partial method
  # @param pack_qtys [Array]
  # @param matches [Array]
  # @param part_order [Array]
  # @param order_qty [Integer]
  # @return part_order
  def diff_match(pack_qtys, matches, part_order)
    pack_qtys.sort { |a, b| b <=> a }.each do |p, v|
      matches << [order_qty / p, p, v]
    end

    matches.each do |x, y, z|
      val = order_qty - (x * y)
      pack_qtys.detect do |a|
        if a[0] == val || a[0] * 3 == val
          part_order << [x, y, z]
          part_order << [val / a[0], a[0], a[1]]
        end
      end
    end

    part_order
  end
end
