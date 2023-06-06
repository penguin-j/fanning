require './src/service/send_email_with_file_service'

module SendEmailWithFile
  class Handler
    def self.execute(event:, context:)
      # TODO
      @req = {
        'source' => 'from@example.com',
        'destinations' => ['to@example.com'],
        'raw_message' => 'Subject: Test email (contains an attachment)\nMIME-Version: 1.0\nContent-type: Multipart/Mixed; boundary="NextPart"\n\n--NextPart\nContent-Type: text/plain\n\n#{text}\n\n--NextPart\nContent-Type: text/plain;\nContent-Disposition: attachment; filename="attachment.txt"\n\n--NextPart--'
      }

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
