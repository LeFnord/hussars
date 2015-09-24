module API
  module Entities
    class ApiError < Grape::Entity
      expose :code, documentation: { type: Integer, desc: 'status code' }
      expose :message, documentation: { type: String, desc: 'error message' }
    end
  end
end
