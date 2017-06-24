class CreateSpreeEbayProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :spree_ebay_products do |t|
      t.integer :product_id, null: false
      t.integer :ebay_store_id, null: false
      t.string :ebay_id
      t.datetime :listed_at
      t.text :custom_description

      t.timestamps
    end

    add_foreign_key :spree_ebay_products, :spree_products,
                    column: :product_id,
                    name: :fw_ebay_products_product_id

    add_foreign_key :spree_ebay_products, :spree_ebay_stores,
                    column: :ebay_store_id,
                    name: :fw_ebay_products_ebay_store_id

    add_index :spree_ebay_products, [:ebay_id],
              name: :index_ebay_products_on_ebay_id_unique,
              unique: true
  end
end
