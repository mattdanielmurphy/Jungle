require 'rails_helper'

describe Product, type: :model do
  describe 'Validations:' do
    it 'should save new product with valid fields' do
      @category = Category.create! name: 'Food'
      @product = @category.products.create(
        name: 'Banana',
        price: 0.75,
        quantity: 2_000
      )
      expect(@product).to_not be_nil
    end

    it 'should raise name error' do
      @category = Category.create! name: 'Food'
      @product = @category.products.create(
        price: 0.75,
        quantity: 2_000
      )
      expect(@product.errors.messages).to include(:name)
    end

    it 'should raise price error' do
      @category = Category.create! name: 'Food'
      @product = @category.products.create(
        name: 'Banana',
        quantity: 2_000
      )
      expect(@product.errors.messages).to include(:price)
    end

    it 'should raise quantity error' do
      @category = Category.create! name: 'Food'
      @product = @category.products.create(
        name: 'Banana',
        price: 0.75
      )
      expect(@product.errors.messages).to include(:quantity)
    end

    it 'should raise category error' do
      @product = Product.create(
        name: 'Banana',
        price: 0.75,
        quantity: 2_000
      )
      expect(@product.errors.messages).to include(:category)
    end
  end
end
