class PlantsController < ApplicationController

    #POST /plants/
    def create
        #byebug
        # plant = Plant.create(name: params[:name], image: params[:image],price: params[:price])
        # render json: plant, except: [:created_at, :updated_at],
        # status: :created
        plant = Plant.create(plant_params)
        render json: plant, except: [:created_at, :updated_at],
        status: :created
    end

    #GET /plants
    def index
        plants = Plant.all
        render json: plants
    end

    #GET /plants/:id
    def show
        plant = Plant.find_by(id: params[:id])
        # if plant
            render json: plant
        # else
        #     render json: {error: "Plant not found"}, status: :not_found
        # end
    end

    def plant_params
        params.permit(:name, :image, :price)
    end
end
