require 'hutch/logging'
require 'hutch/error_handlers/base'

module Hutch
  module ErrorHandlers
    class ReconnectActiveRecord < ErrorHandlers::Base

      def handle(properties, payload, consumer, ex)
        return unless active_record_exception? ex

        logger.info "[Reconnect] Got Active RecordException, message: #{ex.message}"
        logger.info '[Reconnect] Attempting to reconnect'

        ActiveRecord::Base.connection.reconnect!
        logger.info '[Reconnect] Reconnect successful'
        rescue exception
          logger.error "[Reconnect] Unable to reconnect"
          logger.error "[Reconnect] #{exception.class} - #{exception.message}"
      end

      # Does not seem to be used at all, but the base does define this method
      def handle_setup_exception(ex)
        logger.error "[Reconnect] #{ex.class} - #{ex.message}"
        logger.error (['backtrace:'] + ex.backtrace).join("\n")
      end

      def active_record_exception?(ex)
        ex.instance_of? ActiveRecord::StatementInvalid
      end
    end
  end
end
