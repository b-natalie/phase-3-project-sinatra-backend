class ServicesController < ApplicationController

    get "/services" do
        Service.all.to_json
    end

    post "/services" do
        service = Service.create(params)
        service.to_json
    end

    get "/services/:id" do
        service = Service.find(params[:id])
        service.to_json
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