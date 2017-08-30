class Checkout

  attr_accessor :inventory, :basket

  def initialize
    @inventory = set_inventory
    @basket = []
    set_promo({1=> [2, 8.50], 4=> [60, 0.9]})
  end

  def set_promo(args = {})
    @promo = args
  end

  def set_inventory
    {1=> ['tie', 9.25], 2=> ['Sweater', 45.0], 3=> ['skirt', 19.95]}
  end

  def scan(item)
    basket << item
  end

  def total
    total_price = 0
    how_many_each = @basket.each_with_object(Hash.new(0)) { |number, count| count[number] +=1 }
    how_many_each.each do |key, value|
      total_price += calc_price(key, value)
    end
    if total_price >= @promo[4][0]
      total_price = (total_price * @promo[4][1]).round(2)
    else
      total_price.round(2)
    end
  end

  def calc_price(key, value)
    if @promo.has_key?(key) && value >= @promo[key][0]
      value * @promo[key][1]
    else
      value * @inventory[key][1]
    end
  end
end
