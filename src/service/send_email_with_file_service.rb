require './src/helper/aws/ses_client'
require 'mail'

module SendEmailWithFile
  class Service
    def execute(req)
      @source = req['source']
      @destinations = req['destinations']
      @raw_message = construct_raw_message(req)

      Helper::AWS::SesClient.new.send_raw_email(@source, @destinations, @raw_message)

      'OK'
    end

    private

    def construct_raw_message(email_params)
      @mail = Mail.new
      @mail.subject = email_params['subject']
      @mail.body = email_params['body']
      # TODO
      @mail['content-type'] = email_params['contentType']
      @mail['MIME-Version'] = email_params['mimeVersion']
      @mail.add_file(email_params['filePath'])

      @mail.to_s
    end
  end
end
