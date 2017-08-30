require './lib/checkout.rb'

describe Checkout do

  subject { described_class.new() }

  it 'has inventory on initialize' do
    expected_output = {1=> {'tie'=> 9.25}, 2=> {'Sweater'=> 45.0}, 3=> {'skirt'=> 19.95}}
    expect(subject.inventory).to eq expected_output
  end
end
