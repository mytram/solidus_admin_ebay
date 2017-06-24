require 'spec_helper'

RSpec.describe Spree::EbayStore, type: :model do
  let (:ebay_store) { create(:ebay_store) }

  it 'can create ebay store record' do
    expect(ebay_store).to be_truthy
  end
end
