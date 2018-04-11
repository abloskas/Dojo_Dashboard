class DojosController < ApplicationController
  def index
    @dojo = Dojo.all
  end
  
  def new
  end 

  def create
    @a = Dojo.new(create_dojo)
    @a.save
    redirect_to dojos_url
  end

  def show
    @dojo = Dojo.find(params[:id])
  end

  def edit
  end

  def update
    @a = Dojo.find(params[:id])
    @a.update(create_dojo)
    redirect_to dojos_url
  end 

  def destroy 
    @dojo = Dojo.find(params[:id])
    @dojo.destroy
    redirect_to dojos_url
  end 

  private
    def create_dojo
      params.require(:dojo).permit(:branch, :street, :city, :state)
    end 
 
end
