require 'rails_helper'

RSpec.describe BookingsHelper, type: :helper do
  describe '#validParamId?' do
    context 'with valid ids' do
      it 'returns true for positive integers' do
        expect(helper.validParamId?('1')).to be true
        expect(helper.validParamId?('42')).to be true
        expect(helper.validParamId?('1000')).to be true
      end

      it 'returns false for string representations of positive integers with leading zeros' do
        expect(helper.validParamId?('01')).to be false
        expect(helper.validParamId?('042')).to be false
      end
    end

    context 'with invalid ids' do
      it 'returns false for zero' do
        expect(helper.validParamId?('0')).to be false
      end

      it 'returns false for negative integers' do
        expect(helper.validParamId?('-1')).to be false
        expect(helper.validParamId?('-42')).to be false
      end

      it 'returns false for non-integer strings' do
        expect(helper.validParamId?('abc')).to be false
        expect(helper.validParamId?('1.5')).to be false
        expect(helper.validParamId?('1a')).to be false
      end

      it 'returns false for empty string' do
        expect(helper.validParamId?('')).to be false
      end

      it 'returns false for nil' do
        expect(helper.validParamId?(nil)).to be false
      end

      it 'returns false for boolean values' do
        expect(helper.validParamId?(true)).to be false
        expect(helper.validParamId?(false)).to be false
      end

      it 'returns false for floating point numbers' do
        expect(helper.validParamId?('1.0')).to be false
        expect(helper.validParamId?('3.14')).to be false
      end
    end

    context 'with edge cases' do
      it 'returns true for very large integers' do
        expect(helper.validParamId?('9999999999999999')).to be true
      end

      it 'returns false for very large floating point numbers' do
        expect(helper.validParamId?('9999999999999999.5')).to be false
      end
    end
  end
end
