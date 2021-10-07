class ServicesController < ApplicationController

    get "/services" do
        # Service.all.to_json
        services_array = Service.all.map do |service|
            service_json = service.as_json
            service_json[:client_count] = service.clients.count
            service_json
        end
        services_array.to_json
    end

    post "/services" do
        service = Service.create(params)
        service.to_json
    end

    # get "/services/:id" do
    #     service = Service.find(params[:id])
        # service_json = service.as_json
        # service_json[:client_count] = service.clients.count
        # service_json.to_json
    #     service.to_json
    # end

    # service.clients.first.reservations.find_by(service_id: service.id)

    get "/services/:id" do
        service = Service.find(params[:id])
        service_json = service.as_json
        clients = service.clients.all
        clientsResId = clients.map do |client|
            client_json = client.as_json  
            res = client.reservations.find_by(service_id: service.id)
            res_id = res.id
            client_json[:res_id] = res_id
            client_json
        end
        service_json[:clients] = clientsResId
        service_json.to_json
    end


    patch "/services/:id" do
        service = Service.find(params[:id])
        service.update(params)
        service.to_json
    end

    delete "/services/:id" do
        service = Service.find(params[:id])
        service.destroy
    end

end