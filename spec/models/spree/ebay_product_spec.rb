require 'spec_helper'

RSpec.describe Spree::EbayProduct, type: :model do
  let (:ebay_product) { create(:ebay_product) }

  it 'can create ebay product' do
    expect(ebay_product).to be_truthy
    expect(ebay_product.ebay_store).to be_truthy
    expect(ebay_product.product).to be_truthy
  end

  it 'can store custom fields as json string' do
    custom_fields = {
      "notes" => "hello world"
    }
    ebay_product.custom_fields = custom_fields.to_json
    ebay_product.save!
    expect(ebay_product.reload.custom_field('notes')).to eq 'hello world'

    expect(ebay_product.reload.custom_field('spec')).to be_nil
  end
end
