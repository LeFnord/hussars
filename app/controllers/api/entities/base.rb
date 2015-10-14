module API
  module Entities
    class Base < Grape::Entity
      include API::Entities::Defaults
    end
  end
end
