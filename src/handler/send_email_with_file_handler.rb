require './src/service/send_email_with_file_service'

module SendEmailWithFile
  class Handler
    def self.execute(event:, context:)
      @req = event

      @result = SendEmailWithFile::Service.new.execute(@req)

      {
        statusCode: 200,
        body: {
          result: @result
        }.to_json
      }
    end
  end
end
