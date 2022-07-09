class CatagoriesController < ApplicationController
  load_and_authorize_resource
  def splash_screen; end

  def index
    @user = current_user
    @catagories = @user.catagories.includes(:payments)
  end

  def show
    @catagory = Catagory.find(params[:id])
    @payments = @catagory.payments.order('created_at desc')
    puts @payments.length
  end

  def new
    @catagory = Catagory.new
  end

  def create
    @catagory = Catagory.new(catagory_params)
    @catagory.author = current_user
    if @catagory.save
      redirect_to catagories_url, notice: 'Category has been created successfully.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def catagory_params
    params.require(:catagory).permit(:name, :icon, :payment_id)
  end
end
