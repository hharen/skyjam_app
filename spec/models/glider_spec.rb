require 'rails_helper'

RSpec.describe Glider, type: :model do
fixtures :all

  describe '#name' do
    context 'has size and manufacturer'do
      subject(:glider) do
        Glider.new(glider_type: 'Wave 2', size: 'S', manufacturer: 'Skyjam')
      end

      it 'returns "Wave 2 S | Skyjam"' do
        expect(glider.name).to eq('Wave 2 S | Skyjam')
      end
    end

    context 'does not have manufacturer'do
      subject(:glider) do
        Glider.new(glider_type: 'Wave 2', size: 'S')
      end

      it 'returns "Wave 2 S"' do
        expect(glider.name).to eq('Wave 2 S')
      end
    end

    context 'does not have size nor manufacturer'do
      subject(:glider) do
        Glider.new(glider_type: 'Wave 2')
      end

      it 'returns "Wave 2"' do
        expect(glider.name).to eq('Wave 2')
      end
    end

    context 'does not have size'do
      subject(:glider) do
        Glider.new(glider_type: 'Wave 2', manufacturer: 'Skyjam')
      end

      it 'returns "Wave 2 | Skyjam"' do
        expect(glider.name).to eq('Wave 2 | Skyjam')
      end
    end
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

  describe '.student_gliders' do
    subject(:expected_gliders) { gliders(:patricks_glider, :manuelas_glider) }

    it "returns an array of students' gliders" do
      expect(Glider.student_gliders).to eq(expected_gliders)
    end
  end

  describe '.school_gliders' do
    subject(:expected_gliders) { gliders(:school_glider1, :school_glider2) }

    it 'returns an array of school gliders' do
      expect(Glider.school_gliders).to eq(expected_gliders)
    end
  end

  describe '.all_sorted_by_student_first_name' do
    subject(:all_gliders) { gliders( :school_glider1, :school_glider2,
      :manuelas_glider, :patricks_glider) }

    it 'returns an array of all students ordered by first name' do
      expect(Glider.all_sorted_by_student_first_name). to eq(all_gliders)
    end
  end
end
