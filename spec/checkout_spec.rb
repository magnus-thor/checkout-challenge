require './lib/checkout.rb'

describe Checkout do
  subject { described_class.new() }

  it 'has inventory on initialize' do
    expected_output = {1=> ['tie', 9.25], 2=> ['Sweater', 45.0], 3=> ['skirt', 19.95]}
    expect(subject.inventory).to eq expected_output
  end

  it 'has empty basket on initialize' do
    expect(subject.basket).not_to be nil
  end

  it 'adds items to basket' do
    expected_output = [1, 2]
    subject.scan(1)
    subject.scan(2)
    expect(subject.basket).to eq expected_output
  end

  it 'checks out for total value' do
    subject.basket = [1, 2]
    expect(subject.total).to eq(54.25)
  end

  it 'subtracts lower prices for 2 ties' do
    subject.basket = [1, 1, 3]
    expect(subject.total).to eq(36.95)
  end

  it 'subtracts 10% discount for shopping over 60' do
    subject.basket = [1, 2, 2]
    expect(subject.total).to eq(89.33)
  end

  it 'change promo sweater discount' do
    subject.basket = [1, 2, 2]
    subject.set_promo({2=> [2, 40], 'discount'=> [60, 0.9]})
    expect(subject.total).to eq(80.33)
  end

  it 'checks if items are being scanned in correctly' do
    expected_output = 'You did not enter the item properly'
    expect(subject.scan(2.1)).to eq expected_output
    expect(subject.scan('sd')).to eq expected_output
  end

  it 'checks if promo key is being put in properly' do
    expect(subject.set_promo({'i'=>[10, 10]})).to eq({"i"=>[10, 10]})
  end

  it 'checks if promo value are being entered properly' do
    expect(subject.set_promo({1=>['1', 10]})).to eq({1=>["1", 10]}
)
  end

  it 'can delete from promo' do
    expected_output = ([2, 8.5])
    expect(subject.delete_promo(1)).to eq expected_output
  end

  it 'checks if inventory key is properly set up' do
    expect(subject.set_inventory({'1'=>['dress', 19.65]})).to eq({"1"=>["dress", 19.65]})
  end

  it 'checks if inventory value is properly set up' do
    expect(subject.set_inventory({1=>['dress', 19]})).to eq({1=>["dress", 19]})
  end

  it 'can delete from inventory' do
    expected_output = ["tie", 9.25]
    expect(subject.delete_inventory(1)).to eq expected_output
  end
end
