module API
  module Entities
    class Horse < Grape::Entity
      expose :id, documentation: { type: Integer, desc: 'Identity of Horse' }
      expose :name, documentation: { type: String, desc: 'Name of Horse' }
      expose :hussar_id, documentation: { type: Integer, desc: 'Identity of associated Hussar' }
    end
  end
end
