require './src/const/app_const'
require './src/helper/aws/ses_client'
require 'mail'

module SendEmailWithFile
  class Service
    def execute(req)
      # FIXME: 事前にスネークケースに変換しておきたい
      @source = req['fromAddress']
      @destinations = req['toAddresses']
      @raw_message = construct_raw_message(req)

      Helper::AWS::SesClient.new.send_raw_email(@source, @destinations, @raw_message)

      'OK'
    end

    private

    def construct_raw_message(email_params)
      @mail = Mail.new
      @mail.subject = email_params['subject']
      @mail.body = email_params['body']
      # FIXME: 事前にスネークケースに変換しておきたい
      @mail['content-type'] = AppConst.SMTP_PROPS__CONTENT_TYPE
      @mail['MIME-Version'] = AppConst.SMTP_PROPS__MIME_VERSION
      @mail.add_file(email_params['filePath'])

      @mail.to_s
    end
  end
end
