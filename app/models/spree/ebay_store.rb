module Spree
  class EbayStore < Spree::Base
    validates :code, uniqueness: true

    def site_url
      u = URI.parse(url)
      scheme, host, port = u.select(:scheme, :host, :port)

      if port == u.default_port
        "#{scheme}://#{host}"
      else
        "#{scheme}://#{host}:#{port}"
      end
    end
  end
end
