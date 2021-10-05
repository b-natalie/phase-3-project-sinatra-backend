class ReservationsController < ApplicationController

    get "/reservations" do
        Reservation.all.to_json
    end

    post "/reservations" do
        reservation = Reservation.create(params)
        reservation.to_json
    end

    get "/reservations/:id" do
        reservation = Reservation.find(params[:id])
        reservation.to_json
    end

    patch "/reservations/:id" do
        reservation = Reservation.find(params[:id])
        reservation.update(params)
        reservation.to_json
    end

    delete "/reservations/:id" do
        reservation = Reservation.find(params[:id])
        reservation.destroy
    end

end