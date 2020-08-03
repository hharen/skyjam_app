require 'rails_helper'

RSpec.describe Flight, type: :model do

  describe '#manoeuvres_array' do

    context 'no manoeuvres' do
      subject(:flight){ Flight.new }

      it 'returns an empty array' do
        expect(flight.manoeuvres_array).to eq([])
      end
    end

    context 'some manoeuvres' do
      subject(:flight) { Flight.new(manoeuvres: 'B-Stall, PP1, Landevolte') }

      it 'returns an array' do
        expect(flight.manoeuvres_array).to eq(%w(B-Stall PP1 Landevolte))
      end
    end
  end

  describe '#manoeuvres_array=' do
    subject(:flight){ Flight.new }

    it 'sets the manoeuvres' do
      flight.manoeuvres_array=%w(B-Stall PP1 Landevolte)

      expect(flight.manoeuvres).to eq('B-Stall, PP1, Landevolte')
    end
  end
end
