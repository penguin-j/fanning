require 'aws-sdk-ses'

module Helper
  module AWS
    class SesClient
      def initialize
        @client = Aws::SES::Client.new(region: 'ap-northeast-1')
      end

      def send_raw_email(source, destinations, raw_message)
        @client.verify_email_identity(email_address: source)
        @client.send_raw_email({
                                 destinations: destinations,
                                 raw_message: {
                                   data: raw_message
                                 },
                                 source: source
                               })
      end
    end
  end
end
