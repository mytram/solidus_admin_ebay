FactoryGirl.define do
  factory :ebay_store, class: Spree::EbayStore do
    sequence(:id)
    sequence(:name) { |n| "Ebay Store ##{n}" }
    url 'http://www.ebay.com'
    sequence(:code) { |i| "ebay_store_{#{i}}" }
  end
end
