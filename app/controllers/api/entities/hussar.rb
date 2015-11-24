module API
  module Entities
    class Hussar < Grape::Entity
      format_with(:iso_timestamp) { |dt| dt.iso8601 }
      with_options(format_with: :iso_timestamp) do
        expose :created_at
        expose :updated_at
      end

      include API::Entities::Defaults

      expose :born, documentation: { type: String, desc: 'Birthday of Hussar' }
      expose :size, documentation: { type: Integer }
      expose :age, documentation: { type: Integer }
      expose :gender, documentation: { type: Integer }
      expose :horses, using: Entities::Base, documentation: { type: Array, desc: 'Horses of Hussar', is_array: true }
    end
  end
end
