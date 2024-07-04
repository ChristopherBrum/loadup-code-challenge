require 'rails_helper'

RSpec.describe PricingEngine do
  let(:dummy_class) { Class.new { include PricingEngine } }
  let(:dummy_instance) { dummy_class.new }

  describe '#calculate_price' do
    context 'with valid inputs' do
      it 'calculates the correct price for a cat' do
        expect(dummy_instance.calculate_price('Cat', 3)).to eq(35)
      end

      it 'calculates the correct price for a dog' do
        expect(dummy_instance.calculate_price('Dog', 4)).to eq(60)
      end

      it 'accepts lowercase animal types' do
        expect(dummy_instance.calculate_price('cat', 2)).to eq(30)
      end

      it 'accepts symbol animal types' do
        expect(dummy_instance.calculate_price(:dog, 2)).to eq(40)
      end

      it 'accepts string hours' do
        expect(dummy_instance.calculate_price('Cat', '3')).to eq(35)
      end
    end

    context 'with invalid inputs' do
      it 'raises an error for an invalid animal type' do
        expect { dummy_instance.calculate_price('Elephant', 3) }.to raise_error(ArgumentError, "Invalid animal type: Elephant")
      end

      it 'raises an error for hours less than 2' do
        expect { dummy_instance.calculate_price('Cat', 1) }.to raise_error(ArgumentError, "Invalid number of hours: 1")
      end

      it 'raises an error for hours more than 8' do
        expect { dummy_instance.calculate_price('Dog', 9) }.to raise_error(ArgumentError, "Invalid number of hours: 9")
      end
    end

    context 'edge cases' do
      it 'calculates the correct price for minimum hours (2)' do
        expect(dummy_instance.calculate_price('Cat', 2)).to eq(30)
      end

      it 'calculates the correct price for maximum hours (8)' do
        expect(dummy_instance.calculate_price('Dog', 8)).to eq(100)
      end
    end
  end

  describe 'constants' do
    it 'has the correct BASE_CHARGE' do
      expect(PricingEngine::BASE_CHARGE).to eq(20)
    end

    it 'has the correct PRICE_PER_HOUR for Cat' do
      expect(PricingEngine::PRICE_PER_HOUR['Cat']).to eq(5)
    end

    it 'has the correct PRICE_PER_HOUR for Dog' do
      expect(PricingEngine::PRICE_PER_HOUR['Dog']).to eq(10)
    end
  end
end
