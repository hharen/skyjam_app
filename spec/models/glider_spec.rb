require 'rails_helper'

RSpec.describe Glider, type: :model do
  fixtures :all

  describe '#name' do
    context 'glider name' do # how to improve this?
      subject(:glider) do
        Glider.new(glider_type: 'Wave 2', size: 'S', manufacturer: 'Skyjam')
      end

      it 'returns "Wave 2 | Skyjam"' do # should I use '' and "" the other way around?
        expect(glider.name).to eq('Wave 2 S | Skyjam')
      end # should I test also something else?
    end
  end

  describe '#text_color?' do
    context 'glider has color' do
      subject(:glider) do
        Glider.new(color: 'black')
      end

      it 'is true' do
        expect(glider.text_color?).to be true
      end
    end

    context 'glider does not have color' do
      subject(:glider) { Glider.new } # which style is better?

      it 'is false' do
        expect(glider.text_color?).to be false
      end
    end
  end
end
