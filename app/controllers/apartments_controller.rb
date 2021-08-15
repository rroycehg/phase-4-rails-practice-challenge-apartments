class ApartmentsController < ApplicationController

    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show
        apartment = find_apartments
        if apartment
            render json: apartment
        else
            render json: { "error": "Invalid Apartment Number"}, status: :not_found
        end
    end

    def create
        apartment = Apartment.new(apartment_params)
        if apartment.save
            render json: apartment
        else
            render json: { "errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end    

    def update
        apartment = find_apartments
        if apartment
            apartment.update(apartment_params)
            render json: apartment
        else
            render json: { "errors": ["validation errors"]}, status: :unprocessable_entity
        end
    end

    def delete
        
    end

    private

    def find_apartments
        Apartment.find_by(id: params[:id])
    end

    def apartment_params
        params.permit(:number)
    end
end
