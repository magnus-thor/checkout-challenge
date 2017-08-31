class Checkout

  attr_accessor :inventory, :basket, :promo, :message

  def initialize
    @inventory = {}
    @basket = []
    @promo = {}
    add_to_inventory({1=> ['tie', 9.25], 2=> ['Sweater', 45.0], 3=> ['skirt', 19.95]})
    add_to_promo({1=> [2, 8.50], 'discount'=> [60, 0.9]})
  end

  def scan(item)
    if item.is_a? Float or item.is_a? String
      return_message('You did not enter the item properly')
    else
      scan_item(item)
      return_message('item added to basket')
    end
  end

  def set_inventory(item = {})
    item.each do |key, value|
      if key.is_a? Integer
        if value[0].is_a? String and value[1].is_a? Float
          add_to_inventory(item)
          @message = ("Item added to inventory")
        else
          @message = ('you have entered wrong values')
        end
      else
        @message = ('you have entered the wrong key')
      end
    end
    return_message(@message)
  end

  def set_promo(args = {})
    args.each do |key, value|
      if key.is_a? Integer or key == 'discount'
        if value[0].is_a? Integer and value[1].is_a? Integer
          add_to_promo(args)
          @message = ("promo added")
        else
          @message = ("you have put in wrong values")
        end
      else
        @message = ("you have put in wrong key")
      end
    end
    return_message(@message)
  end

  def delete_promo(item)
    @promo.delete(item)
  end

  def delete_inventory(item)
    @inventory.delete(item)
  end

  def total
    total_price = 0
    how_many_each = @basket.each_with_object(Hash.new(0)) { |number, count| count[number] +=1 }
    how_many_each.each do |key, value|
      total_price += calc_price(key, value)
    end
    if total_price >= @promo['discount'][0]
      total_price = (total_price * @promo['discount'][1]).round(2)
    else
      total_price.round(2)
    end
  end


  private

  def scan_item(item)
    basket << item
  end

  def calc_price(key, value)
    if @promo.has_key?(key) && value >= @promo[key][0]
      value * @promo[key][1]
    else
      value * @inventory[key][1]
    end
  end

  def add_to_inventory(args = {})
    @inventory.merge!(args)
  end

  def add_to_promo(args = {})
    @promo.merge!(args)
  end

  def return_message(message)
    message
  end
end
