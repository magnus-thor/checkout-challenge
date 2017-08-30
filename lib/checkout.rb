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
end
