class CatagoriesController < ApplicationController
	def splash_screen

	end

	def index
       @user = current_user
       @catagories = @user.catagories.includes(:payments)
	end

	def show

	end

	def new

	end

	def create
	  catagory = Catagory.new(save_params)
	  catagory.author = current_user
	  if catagory.save
	    redirect_to catagories_url, notice: "Category has been created successfully."
	  else
	  	redirect_to new_catagory_url, notice: "Name or Icon is wrong"
	  end   		
	end

	private

	def save_params
		params.permit(:name,:icon)
	end	
end
