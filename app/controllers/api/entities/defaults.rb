module API
  module Entities
    module Defaults
      extend ActiveSupport::Concern
      included do
        expose :id, documentation: { type: Integer, desc: 'identity of a resource' }
        expose :name, documentation: { type: String, desc: 'name of the resource' }
        expose :href, documentation: { type: String, desc: 'URI of the resource' }
      end
    end
  end
end
