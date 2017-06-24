require 'spec_helper'

RSpec.describe Spree::EbayProduct, type: :model do
  let (:ebay_product) { create(:ebay_product) }

  it 'can create ebay product' do
    expect(ebay_product).to be_truthy
    expect(ebay_product.ebay_store).to be_truthy
    expect(ebay_product.product).to be_truthy
  end
end
