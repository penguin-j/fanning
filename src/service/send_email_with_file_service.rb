require 'json'
require 'aws-sdk-ses'

module SendEmailWithFile
  class Service
    def execute
      @client = Aws::SES::Client.new(region: 'ap-northeast-1', endpoint: 'http://localhost:4566')
      @client.verify_email_identity(email_address: 'from@example.com')
      @client.send_raw_email({
                               destinations: [
                                 'to@example.com'
                               ],
                               raw_message: {
                                 data: 'Subject: Test email (contains an attachment)\nMIME-Version: 1.0\nContent-type: Multipart/Mixed; boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\nThis is the message body.\n\n--NextPart\nContent-Type: text/plain;\nContent-Disposition: attachment; filename="attachment.txt"\n\nThis is the text in the attachment.\n\n--NextPart--'
                               },
                               source: 'from@example.com'
                             })
      'OK'
    end
  end
end
