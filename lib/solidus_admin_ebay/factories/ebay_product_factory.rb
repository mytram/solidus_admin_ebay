FactoryGirl.define do
  factory :ebay_product, class: Spree::EbayProduct do
    sequence(:id)
    product { create(:product) }
    ebay_store { create(:ebay_store) }
  end
end
