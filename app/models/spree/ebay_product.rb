module Spree
  class EbayProduct < Spree::Base
    validates :ebay_store, presence: true
    validates :product, presence: true

    belongs_to :product, class_name: 'Spree::Product'
    belongs_to :ebay_store, class_name: 'Spree::EbayStore'

    self.whitelisted_ransackable_associations = %w[ebay_store product]
    self.whitelisted_ransackable_attributes = %w[ebay_id listed_at]

    # custom properties

    def custom_field(name)
      return if custom_fields.blank?

      @custom_fields = JSON.parse(custom_fields) unless @custom_fields

      @custom_fields[name.to_s]
    end

    def url
      [ebay_store.site_url, 'itm', ebay_id].join('/')
    end
  end
end
