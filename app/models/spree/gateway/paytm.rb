module Spree
  class Gateway::Paytm < Gateway
    preference :merchant_id, :string
    preference :merchant_key, :string
    preference :website, :string
    preference :industry_type_id, :string
    preference :channel_id, :string
    preference :site_url, :string
    include Spree::Gateway::EncryptionNewPG

    def supports?(source)
      true
    end

    def provider_class
      self
    end

    def provider
      self
    end

    def auto_capture?
      true
    end

    def method_type
      "paytm"
    end

    def purchase(amount, source, gateway_options={})
      ActiveMerchant::Billing::Response.new(true, "paytm success")
    end

    def txnid(order)
      "#{order.id.to_s}-#{SecureRandom.random_number(100000)}-#{order.number.to_s}"
    end

    def refund_url
      'https://' + domain + '/oltp/HANDLER_INTERNAL/REFUND'
    end

    def status_query_url
      'https://' + domain + '/oltp/HANDLER_INTERNAL/TXNSTATUS'
    end

    def txn_url
      'https://' + domain + '/order/process'
    end

    def request_type
      'DEFAULT' #or SUBSCRIBE
    end
    ### function returns dictionary of encrypted data ###
    ### accepts a dictionary with data and key to encrypt with ###
    ### can accept multiple key value pairs in the dictionary ###


    def generate_checksum parameters, merchant_key
      new_pg_checksum(parameters, merchant_key.gsub("\n",''))
    end

    def verify_checksum
      new_pg_verify_checksum(@paytmparams, @checksum_hash, @paytm_keys['PAYTM_MERCHANT_KEY'])
    end

    private
    def domain
      domain = 'securegw.paytm.in'
      if (preferred_test_mode == true)
        domain = 'securegw-stage.paytm.in'
      end
      domain
    end
  end
end
