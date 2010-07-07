require 'spec_helper'

describe Chargified::Customer do

  describe '.find' do
    it 'should pass to Chargified::Customer.all' do
      Chargified::Customer.should_receive(:all)
      Chargified::Customer.find(:all)
    end

    it 'should return nil if the subscriber does not exist'

    it 'should return a Customer with an id for an existing customer'
  end

  describe '.all' do
    it 'should return an empty array if there are no customers'

    it 'should return an array of customers if there are any to find'
  end
end
