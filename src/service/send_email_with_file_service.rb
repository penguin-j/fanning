require 'aws-sdk-ses'

module SendEmailWithFile
  class Service
    def execute
      @source = 'from@example.com'
      @destinations = ['to@example.com']
      @raw_message = 'Subject: Test email (contains an attachment)\nMIME-Version: 1.0\nContent-type: Multipart/Mixed; boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n#{text}\n\n--NextPart\nContent-Type: text/plain;\nContent-Disposition: attachment; filename="attachment.txt"\n\n--NextPart--'

      @client = Aws::SES::Client.new(region: 'ap-northeast-1', endpoint: 'http://localhost:4566')
      @client.verify_email_identity(email_address: @source)
      @client.send_raw_email({
                               destinations: @destinations,
                               raw_message: {
                                 data: @raw_message
                               },
                               source: @source
                             })

      'OK'
    end
  end
end
