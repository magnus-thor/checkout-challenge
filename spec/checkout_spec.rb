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
end
