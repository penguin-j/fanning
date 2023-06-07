require './src/service/send_email_with_file_service'

module SendEmailWithFile
  class Handler
    def self.execute(event:, context:)
      # TODO
      @req = {
        'source' => 'from@example.com',
        'destinations' => ['to@example.com'],
        'subject' => 'Here is a subject.',
        'body' => 'Here is a body.',
        'content_type' => 'text/plain',
        'mime_version' => '1.0',
        'file_path' => 'temp/attachment.txt'
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
