module API
  module Defaults
    # if you're using Grape outside of Rails, you'll have to use Module#included hook
    extend ActiveSupport::Concern

    included do
      # common Grape settings
      format :json

      # global handler for simple not found case
      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(message: e.message, status: 404)
      end

      # global exception handler, used for error notifications
      rescue_from :all do |e|
        raise e
        error_response(message: "Internal server error: #{e}", status: 500)
      end

      # HTTP header based authentication
      # before do
      #   error!('Unauthorized', 401) unless headers['Authorization'] == "some token"
      # end
    end
  end
end
