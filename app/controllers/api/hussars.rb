module API
  class Hussars < Grape::API
    include API::Defaults

    resource :hussars do
      desc "Return list of hussars"
      get do
        hussars = Hussar.all
        present :total_page, 10
        present :per_page, 20
        present :resources, hussars
      end

      desc "Returns specific hussar."
      params do
        requires :id, type: Integer, desc: "Identity.", documentation: { example: '1'}
      end

      get ":id" do
        hussar = Hussar.find_by_id(params[:id])
        present :hussar, hussar
        present :horses, hussar.horses if hussar
      end

      desc "Update a hussar.", http_status: 201
      params do
        requires :id, type: Integer, desc: "Identity.", documentation: { example: 1}
        requires :name, type: String, desc: "Name.", documentation: { example: 'Jon'}
        requires :born
      end

      put ":id" do
        hussar = Hussar.find_by_id(params[:id])
        hussar.name = params[:name]
        hussar.born = params[:born]
        hussar.save!
        hussar
      end

      desc "Create a hussar."
      params do
        requires :name, type: String, desc: "Name."
        requires :born, type: Date, desc: "Birthday."
      end
      post do
        Hussar.create!({
          name: params[:name],
          born: params[:born]
        })
      end

      desc "Delete a hussar."
      params do
        requires :id, type: Integer, desc: "Identity."
      end

      delete ":id" do
        route.route_params[params[:id]] # yields the parameter description
      end

    end
  end
end
