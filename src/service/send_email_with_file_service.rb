require './src/helper/aws/ses_client'
require 'mail'

module SendEmailWithFile
  class Service
    def execute(req)
      @source = req['source']
      @destinations = req['destinations']
      @raw_message = construct_raw_message

      Helper::AWS::SesClient.new.send_raw_email(@source, @destinations, @raw_message)

      'OK'
    end

    private

    def construct_raw_message
      @mail = Mail.new
      @mail.subject = 'Here is a subject.'
      @mail.body = 'Here is a body.'
      @mail['content-type'] = 'text/plain'
      @mail['MIME-Version'] = '1.0'
      @mail.add_file('temp/attachment.txt')

      @mail.to_s
    end
  end
end
