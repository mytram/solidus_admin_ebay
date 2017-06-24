class Spree::EbayProduct < ApplicationRecord
  belongs_to :product, class_name: 'Spree::Product'
  belongs_to :ebay_store, class_name: 'Spree::EbayStore'
end
