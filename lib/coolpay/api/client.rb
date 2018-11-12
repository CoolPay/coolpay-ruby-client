require 'coolpay'
require 'coolpay/api/request'
require 'coolpay/api/errors'

module CoolPay
  class << self
    attr_accessor :base_uri
  end

  module API
    class Client
      attr_accessor :options
      
      def initialize(auth_params = {}, opts = {})
        opts[:secret]   ||= extract_auth(auth_params)
        opts[:base_uri] ||= (CoolPay.base_uri || CoolPay::BASE_URI)

        @options = opts.dup
      end
      
      def extract_auth params
        if params[:email] and params[:password]  
          "#{params[:email]}:#{params[:password]}"
        elsif params[:api_key]
          ":#{params[:api_key]}"
        end
      end

      [:get, :post, :patch, :put, :delete, :head].each do |method|
        define_method(method) do |*args|
          Request.new(options).request(method, *args)
        end
      end
    end
  end
end
