require 'json'

module SendEmailWithFile
  class Handler
    def self.execute(event:, context:)
      {
        statusCode: 200,
        body: {
          message: 'Go Serverless v1.0! Your function executed successfully!',
          input: event
        }.to_json
      }
    end
  end
end
