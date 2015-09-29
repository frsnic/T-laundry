require 'rails_helper'

RSpec.describe Order, type: :model do

  it "has none to begin with" do
    expect(Order.count).to eq 0
  end

  it "has one after adding one" do
    Order.create(store_id: 1, client_id: 1, user_id: 1)
    expect(Order.count).to eq 1
  end

  it "has none after one was created in a previous example" do
    expect(Order.count).to eq 0
  end

  describe "create with 2 order_items" do

    before(:each) do
      @order = Order.create(store_id: 1, client_id: 1, user_id: 1)
      OrderItem.create(order_id: @order.id, cloth_title: 'Cloth Title', wash_way: SecureRandom.hex)
      OrderItem.create(order_id: @order.id, cloth_title: 'Cloth Title', wash_way: SecureRandom.hex)
    end

    describe ", order initialize" do

      it ", order status should be processing" do
        expect(@order.status).to eq "processing"
      end

      it ", fetched_at should be length=0 string" do
        expect(@order.fetched_at).to eq ""
      end

    end

    describe ", order_item first finish" do

      before(:each) do
        @order.order_items.first.update(status: OrderItem.statuses[:finish])
        @order = Order.first
      end

      it ", order status should be processing" do
        expect(@order.status).to eq "processing"
      end

      it ", fetched_at should be length=0 string" do
        expect(@order.fetched_at).to eq ""
      end

    end

    describe ", order_item all finish" do

      before(:each) do
        @order.order_items.update_all(status: OrderItem.statuses[:finish])
        @order = Order.first
      end

      it ", order status should be processing" do
        expect(@order.status).to eq "finish"
      end

      it ", fetched_at should be length=0 string" do
        expect(@order.fetched_at).to eq ""
      end

    end

    describe ", order_item first out" do

      before(:each) do
        @order.order_items.first.update(status: OrderItem.statuses[:out], fetched_at: Time.now())
        @order = Order.first
      end

      it ", order status should be processing" do
        expect(@order.status).to eq "processing"
      end

      it ", fetched_at should be length=0 string" do
        expect(@order.fetched_at).to eq ""
      end

    end

    describe ", order_item one finish, one out" do

      before(:each) do
        @order.order_items.first.update(status: OrderItem.statuses[:finish])
        @order.order_items.last.update( status: OrderItem.statuses[:out], fetched_at: Time.now())
        @order = Order.first
      end

      it ", order status should be processing" do
        expect(@order.status).to eq "finish"
      end

      it ", fetched_at should be length=0 string" do
        expect(@order.fetched_at).to eq ""
      end

    end

    describe ", order_item all out" do

      before(:each) do
        @order.order_items.update_all(status: OrderItem.statuses[:out], fetched_at: Time.now())
        @order = Order.first
      end

      it ", order status should be processing" do
        expect(@order.status).to eq "out"
      end

      it ", fetched_at should be length=0 string" do
        expect(@order.fetched_at.class).to eq ActiveSupport::TimeWithZone
      end

    end

  end

end
