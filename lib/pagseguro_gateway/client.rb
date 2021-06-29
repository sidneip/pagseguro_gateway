require 'pagseguro_gateway/client/charge_api'
module PagseguroGateway
  class Client
		attr_accessor :access_token
    include HTTParty
    base_uri "https://sandbox.api.pagseguro.com"
    format :json

    def initialize(access_token)
      self.access_token = access_token || ENV["PAGSEGURO_TOKEN"]
			self.class.default_options.merge!(headers: { 'Authorization' => "#{access_token}" })
    end

		def charges
			PagseguroGateway::Client::ChargeApi.new(self)
		end

		def get(path, options  = {})
      self.class.get(path, options)
    end

    def post(path, options = {})
      self.class.post(path, body: options.to_json, headers: default_headers)
    end

    def put(path, options = {})
      self.class.put(path, body: options.to_json, headers: default_headers)
    end

    def default_headers
      { 'Content-Type' => 'application/json' }
    end

  end
end
