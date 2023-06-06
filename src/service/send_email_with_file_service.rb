require './src/helper/aws/ses_client'

module SendEmailWithFile
  class Service
    def execute
      @source = 'from@example.com'
      @destinations = ['to@example.com']
      @raw_message = 'Subject: Test email (contains an attachment)\nMIME-Version: 1.0\nContent-type: Multipart/Mixed; boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n#{text}\n\n--NextPart\nContent-Type: text/plain;\nContent-Disposition: attachment; filename="attachment.txt"\n\n--NextPart--'

      Helper::AWS::SesClient.new.send_raw_email(@source, @destinations, @raw_message)

      'OK'
    end
  end
end
