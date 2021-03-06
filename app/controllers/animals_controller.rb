class AnimalsController < ApplicationController

  def index
    if params.has_key? "random"
      @animals = Animal.order("RANDOM()").all
    elsif params[:species]
      species = params[:species]
      @animals = Animal.search(species)
    else
      @animals = Animal.all
    end
    json_response(@animals)
  end

  def show
    @animal = Animal.find(params[:id])
    json_response(@animal)
  end

  def create
    @animal = Animal.create!(animal_params)
    json_response(@animal, :created)
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update!(animal_params)
      render status: 200, json: {
        message: "This animal has been updated successfully!"
      }
    end
  end

  def destroy
    @animal = Animal.find(params[:id])
    if @animal.destroy
      render status: 200, json: {
        message: "Animal successfully deleted!"
      }
    end
  end

  private 

    def animal_params
      params.permit(:species, :name, :id)
    end

end    