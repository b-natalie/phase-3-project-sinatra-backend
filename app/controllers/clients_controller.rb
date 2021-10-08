class ClientsController < ApplicationController

    get "/clients" do
        # Client.all.to_json
        clients_array = Client.all.map do | client |
            client_json = client.as_json
            client_json[:service_count] = client.services.count
            client_json
        end
        clients_array.to_json
    end

    post "/clients" do
        # client = Client.create(
        #     first_name: params[:firstName],
        #     last_name: params[:lastName],
        #     email: params[:email]
        # )
        client = Client.create_with(
            first_name: params[:firstName], 
            last_name: params[:lastName]).find_or_create_by(email: params[:email])
        client.to_json
    end

    get "/clients/:id" do
        client = Client.find(params[:id])
        client_json = client.as_json
        services = client.services.all
        servicesResId = services.map do |service|
            service_json = service.as_json
            res = service.reservations.find_by(client_id: client.id)
            res_id = res.id
            service_json[:res_id] = res_id
            service_json
        end
        client_json[:services] = servicesResId
        client_json.to_json
    end

    patch "/clients/:id" do
        client = Client.find(params[:id])
        client.update(
            first_name: params[:firstName],
            last_name: params[:lastName],
            email: params[:email]
        )
        client.to_json
    end

    delete "/clients/:id" do
        client = Client.find(params[:id])
        client.destroy
    end

end