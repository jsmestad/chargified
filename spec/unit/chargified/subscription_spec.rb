require 'spec_helper'

describe Chargified::Subscription do

  describe ".find" do
    describe "with the symbol :all" do
      it "should pass to Chargified::Subscriber.all" do
        Chargified::Subscription.should_receive(:all)
        Chargified::Subscription.find(:all)
      end
    end

    it "should return nil with an id for a subscriber who doesn't exist"

    it "should return a Subscriber with an id for an existing subscriber"
  end

  describe '.all' do
    it "should return an empty array if there are no subscribers"

    it "should return an array of subscribers if there are any to find"
  end

  describe ".destroy_all" do
    it "should return true if successful"
  end

end
