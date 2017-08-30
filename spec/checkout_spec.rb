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
    subject.basket = [1, 2, 3]
    expect(subject.total).to eq(74.2)
  end
end
