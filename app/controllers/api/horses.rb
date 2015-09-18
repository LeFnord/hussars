module API
  class Horses < Grape::API
    include API::Defaults

    resources :horses do
      desc 'Get all horses'
      get do
        horses = Horse.all
        present :total_page, 10
        present :per_page, 20
        present :resources, horses
      end

      desc "Returns specific horse."
      params do
        requires :id, type: Integer, desc: "Identity.", documentation: { example: '1'}
      end

      get ":id" do
        horse = Horse.find_by_id(params[:id])
        present :horse, horse
        present :hussar, horse.hussar
      end

      # desc "Create a horse."
      # params do
      #   requires :hussar_id, type: Integer
      #   requires :name, type: String, desc: "Name."
      # end
      # post do
      #   horse = Horse.create!({name: params[:name]})
      #   hussar = Hussar.find_by_id(params[:hussar_id])
      #   hussar.horses << horse
      #
      #   horse
      # end

    end
  end
end
