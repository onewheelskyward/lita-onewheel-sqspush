require 'aws-sdk-sqs'
require 'aws-sdk-sts'

module Lita
  module Handlers
    class OnewheelSqspush < Handler
      config :api_key
      config :api_secret

      route /t1a5\s+(.*)$/i, :handle_weirdai

      def message_sent?(sqs_client, queue_url, message_body)
        sqs_client.send_message(
          queue_url: queue_url,
          message_body: message_body
        )
        true
      rescue StandardError => e
        puts "Error sending message: #{e.message}"
        false
      end

      def handle_weirdai(response)
        response.reply response.matches[0][0]
        region = 'us-west-2'
        queue_name = 'cats-on-the-moon'
        message_body = response.matches[0][0]

        Aws.config.update(
          region: region,
          credentials: Aws::Credentials.new(config.api_key, config.api_secret)
        )

        sts_client = Aws::STS::Client.new

        # For example:
        # 'https://sqs.us-east-1.amazonaws.com/111111111111/my-queue'
        queue_url = "https://sqs.#{region}.amazonaws.com/#{sts_client.get_caller_identity.account}/#{queue_name}"

        sqs_client = Aws::SQS::Client.new

        Lita.logger.info "Sending a message to the queue named '#{queue_name}'..."

        if message_sent?(sqs_client, queue_url, message_body)
          puts 'Message sent.'
        else
          puts 'Message not sent.'
        end
      end

      Lita.register_handler(self)
    end
  end
end
