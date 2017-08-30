class Checkout

  attr_accessor :inventory, :basket

  def initialize
    @inventory = set_inventory
    @basket = []
  end

  def set_inventory
    {1=> ['tie', 9.25], 2=> ['Sweater', 45.0], 3=> ['skirt', 19.95]}
  end

  def scan(item)
    basket << item
  end

  def total(total)
    how_many_each = total.each_with_object(Hash.new(0)) { |number, count| count[number] +=1 }
    total_price = item1(how_many_each[1]) + item2(how_many_each[2]) +item3(how_many_each[3])
  end

  def item1(item)
    item * @inventory[1][1]
  end

  def item2(item)
    item * @inventory[2][1]
  end

  def item3(item)
    item * @inventory[3][1]
  end
end
