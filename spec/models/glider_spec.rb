require 'rails_helper'

RSpec.describe Glider, type: :model do
  fixtures :all

  describe '#name' do
    subject(:glider) do
      Glider.new(glider_type: 'Wave 2', size: 'S', manufacturer: 'Skyjam')
    end

    it 'returns "Wave 2 | Skyjam"' do
      expect(glider.name).to eq('Wave 2 S | Skyjam')
    end # should I test also something else?
  end

  describe '#text_color?' do
    context 'glider has color' do
      subject(:glider) { Glider.new(color: 'black') }

      it 'is true' do
        expect(glider.text_color?).to be true
      end
    end

    context 'glider does not have color' do
      subject(:glider) { Glider.new }

      it 'is false' do
        expect(glider.text_color?).to be false
      end
    end
  end
end
