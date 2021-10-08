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
        client.to_json
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