module Spree
  module Admin
    class EbayProductsController < ResourceController
      before_action :load_data

      def index
        session[:return_to] = request.url
        respond_with(@collection)
      end

      def all
        ebay_store = Spree::EbayStore.find_by(id: params[:ebay_store_id])

        if ebay_store.nil?
          flash[:error] = Spree.t :ebay_store_not_found
        else
          count = 0
          @products.each do |product|
            unless Spree::EbayProduct.exists?(ebay_store_id: ebay_store.id,
                                              product_id: product.id)
              Spree::EbayProduct.create!(
                ebay_store_id: ebay_store.id,
                product_id: product.id
              )
              count += 1
            end
          end

          flash[:success] = Spree.t :add_n_products_to_ebay_store, count: count,
                                    store: ebay_store.name
        end
        respond_to do |format|
          format.html { redirect_to collection_url }
          format.js { render layout: false }
        end
      end

      private

      def load_data
        @ebay_stores = Spree::EbayStore.all
        @products = Spree::Product.all
      end

      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:s] ||= "spree_products.name asc"
        # @search needs to be defined as this is passed to search_form_for
        @search = super.ransack(params[:q])
        @collection = @search.result
                             .page(params[:page])
                             .per(Spree::Config[:admin_products_per_page])
      end
    end
  end
end
