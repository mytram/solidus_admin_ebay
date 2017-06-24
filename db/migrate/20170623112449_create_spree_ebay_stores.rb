class CreateSpreeEbayStores < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_ebay_stores do |t|
        t.string :name, null: false
        t.string :url
        t.string :code, null: false
        t.timestamps null: true
    end

    add_index :spree_ebay_stores,
              [:code],
              name: :index_ebay_stores_on_code_unique,
              unique: true
  end
end
