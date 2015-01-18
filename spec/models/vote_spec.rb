require 'rails_helper'

describe Vote do
    describe "validation" do
      describe 'value validation' do
        it 'only allows -1 or a sa values' do

        v = Vote.new(value: 1)
        expect(v.valid?).to eq(true)

        v = Vote.new(value: -1)
        expect(v.valid?).to eq(true)

        v = Vote.new(value: 0)
        expect(v.valid?).to eq(false)

        v = Vote.new(value: 2)
        expect(v.valid?).to eq(false)

        v = Vote.new(value: -2)
        expect(v.valid?).to eq(false)

        end
      end
    end
end