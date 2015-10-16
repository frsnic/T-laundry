require 'rails_helper'

RSpec.describe Order, type: :model do

  it "has a valid factory" do
    expect(FactoryGirl.create(:order).valid?).to be true
  end

  it "is invalid without a store_id" do
    expect(FactoryGirl.build(:order, store_id: nil).valid?).to be false
  end

  it "is invalid without a client_id" do
    expect(FactoryGirl.build(:order, client_id: nil).valid?).to be false
  end

  it "is invalid without a user_id" do
    expect(FactoryGirl.build(:order, user_id: nil).valid?).to be false
  end

  it "is invalid without a price" do
    expect(FactoryGirl.build(:order, price: nil).valid?).to be false
  end

  it "is invalid when price greater than 100000" do
    expect(FactoryGirl.build(:order, price: 500000).valid?).to be false
  end

  it "is invalid when price less than 0" do
    expect(FactoryGirl.build(:order, price: -50).valid?).to be false
  end

  describe "#create order_with_items," do

    let(:order) { FactoryGirl.create :order_with_items }

    context "initialize," do

      it "order status should be processing" do
        expect(order.status).to eq "processing"
      end

      it "fetched_at should be length=0 string" do
        expect(order.fetched_at).to eq ""
      end

    end

    context "order_item first finish," do

      before(:each) do
        order.order_items.first.update(status: OrderItem.statuses[:finish])
      end

      it "order status should be processing" do
        expect(order.status).to eq "processing"
      end

      it "fetched_at should be length=0 string" do
        expect(order.fetched_at).to eq ""
      end

    end

    context "order_item all finish," do

      before(:each) do
        order.order_items.update_all(status: OrderItem.statuses[:finish])
      end

      it "order status should be processing" do
        expect(order.status).to eq "finish"
      end

      it "fetched_at should be length=0 string" do
        expect(order.fetched_at).to eq ""
      end

    end

    context "order_item first out," do

      before(:each) do
        order.order_items.first.update(status: OrderItem.statuses[:out], fetched_at: Time.now())
      end

      it "order status should be processing" do
        expect(order.status).to eq "processing"
      end

      it "fetched_at should be length=0 string" do
        expect(order.fetched_at).to eq ""
      end

    end

    context "order_item one finish, one out," do

      before(:each) do
        order.order_items.first.update(status: OrderItem.statuses[:finish])
        order.order_items.last.update( status: OrderItem.statuses[:out], fetched_at: Time.now())
      end

      it "order status should be processing" do
        expect(order.status).to eq "finish"
      end

      it "fetched_at should be length=0 string" do
        expect(order.fetched_at).to eq ""
      end

    end

    context "order_item all out," do

      before(:each) do
        order.order_items.update_all(status: OrderItem.statuses[:out], fetched_at: Time.now())
      end

      it "order status should be processing" do
        expect(order.status).to eq "out"
      end

      it "fetched_at.class should be ActiveSupport::TimeWithZone" do
        expect(order.fetched_at.class).to eq ActiveSupport::TimeWithZone
      end

    end

  end

end
