module API
  class Base < Grape::API
    mount API::Hussars
    mount API::Horses

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    add_swagger_documentation :format => :json,
                              :hide_format => true,
                              # :base_path => "/api",
                              # :host => "localhost:3040",
                              :hide_documentation_path => false,
                              :api_version => 'v1',
                              :info => {
                                title: "Horses and Hussars",
                                description: "Demo app for dev of grape swagger 2.0"
                              }

  end
end
