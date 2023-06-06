require './src/helper/aws/ses_client'

module SendEmailWithFile
  class Service
    def execute(req)
      @source = req['source']
      @destinations = req['destinations']
      @raw_message = req['raw_message']

      Helper::AWS::SesClient.new.send_raw_email(@source, @destinations, @raw_message)

      'OK'
    end
  end
end
