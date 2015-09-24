module API
  module Entities
    class Hussar < Grape::Entity
      expose :id, documentation: { type: Integer, desc: 'Identity of Hussar' }
      expose :name, documentation: { type: String, desc: 'Name of Hussar' }
      expose :born, documentation: { type: String, desc: 'Birthday of Hussar' }
      expose :horses, using: Entities::Horse, documentation: { type: Array, desc: 'Horses of Hussar', is_array: true }
    end
  end
end
