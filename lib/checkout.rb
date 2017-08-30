class Checkout

  attr_accessor :inventory

  def initialize
    @inventory = set_inventory
  end

  def set_inventory
    {1=> {'tie'=> 9.25}, 2=> {'Sweater'=> 45.0}, 3=> {'skirt'=> 19.95}}
  end
end
