class PetsController < ApplicationController
  def index
    # Retrieves an array of all the objects in the Pet model. 
    @pets = Pet.all
  end

  def show # Display all pets
    @pet = Pet.find(params[ :id])
  end

  def new
    @pet = Pet.new
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def create # Add a new pet
    @pet = Pet.new(pet_params)
    
    if @pet.save
      redirect_to @pet # if successful, shows the new pet
    else
      render 'new' # if fails, shows the form to user
    end
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      redirect_to @pet
    else
      render 'edit'
    end
  end

  def destroy
    @pet = Pet.find(params[:id])
    @pet.destroy
    redirect_to pets_path
  end

  private 
  def pet_params
    params.require(:pet).permit( :name, :age, :description)
  end
end
