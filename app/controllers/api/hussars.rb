module API
  class Hussars < Grape::API
    include API::Defaults

    resource :hussars do
      desc 'Return list of hussars',
        is_array: true,
        http_codes: [ { code: 200, message: "Get something", model: Entities::Base } ]
      get do
        hussars = Hussar.all
        present :total_page, 10
        present :per_page, 20
        present :hussars, hussars, with: Entities::Base
      end

      desc 'Returns specific hussar', params: Entities::Hussar.documentation
      params do
        requires :id, type: Integer, desc: 'Identifier of Hussar', documentation: { example: '1'}
      end
      get ':id' do
        hussar = Hussar.find_by_id(params[:id])
        horses = hussar.horses
        present hussar, with: Entities::Hussar
      end

      desc 'Create a hussar' do
        http_codes [
          {code: 201, message: 'Hussar created'},
          {code: 422, message: 'Validation Errors', model: Entities::ApiError}
        ]
      end
      params do
        requires :name, type: String, desc: 'Name of Hussar to create'
        requires :born, type: Date, desc: 'Birthday of Hussar to create'
      end
      post do
        hussar = Hussar.create!({
          name: params[:name],
          born: params[:born]
        })
        present hussar, with: Entities::Hussar
      end

      desc 'Update a hussar' do
        http_codes [
          {code: 422, message: 'Validation Errors', model: Entities::ApiError}
        ]
      end
      params do
        requires :id, type: Integer, desc: 'Identity of Hussar', documentation: { example: 1}
        optional :name, type: String, desc: 'Name of Hussar', documentation: { example: 'Jon'}
        optional :born, type: Date, desc: 'Birthday of Hussar', documentation: { example: '07-07-1972'}
      end
      put ':id' do
        hussar = Hussar.find_by_id(params[:id])
        hussar.name = params[:name]
        hussar.born = params[:born]
        hussar.save!
        present hussar, with: Entities::Hussar
      end

      desc 'Delete a hussar'
      params do
        requires :id, type: Integer, desc: 'Identity of Hussar to delete', documentation: { example: '1'}
      end

      delete ':id' do
        route.route_params[params[:id]] # yields the parameter description
      end

    end
  end
end
