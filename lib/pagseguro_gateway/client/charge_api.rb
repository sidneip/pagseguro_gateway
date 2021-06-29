module PagseguroGateway
  class Client
    class ChargeApi
      attr_accessor :client

      def initialize(client)
        self.client = client
      end

      def create(params)
        response = client.post('/charges', params)
      end
    end
  end
end