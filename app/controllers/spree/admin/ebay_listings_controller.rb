module Spree
  module Admin
    class EbayListingsController < BaseController
      layout false

      before_action :load_data, except: [:index]
      before_action :prepend_view_paths

      private

      def load_data
        @product = Spree::Product.find_by_slug(params[:id])
        @ebay_product = Spree::EbayProduct.find_by_product_id(@product.id)
      end

      def prepend_view_paths
        if @ebay_product
          store_view_dir = @ebay_product.ebay_store.code.tr('-', '_')
          puts "xxx rails root: #{Rails.root}"
          puts "xxx #{Rails.root}/app/views/#{store_view_dir}"
          prepend_view_path "#{Rails.root}/app/views/#{store_view_dir}"
        end
      end
    end
  end
end
