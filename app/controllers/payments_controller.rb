class PaymentsController < ApplicationController
	load_and_authorize_resource
	def new
	  @payment = Payment.new
      @catagory = Catagory.find(params[:catagory_id])
	end

	def create 
      payment = Payment.find_by(id:params[:payment][:id]) if params[:payment][:id]
	  payment = Payment.new(payment_params) unless params[:payment][:id]
	  @payment = payment if payment.present?
	  @payment = Payment.new(author:current_user) unless payment.present?
	  @payment.author = current_user
      @catagory = Catagory.find(params[:catagory_id])
	  if @payment.save 
	  	@catagory.payments << @payment
	    redirect_to catagory_url(@catagory), notice: "Transaction has been created successfully."
	  else
	  	render :new, status: :unprocessable_entity
	  end   		
	end

	private

	def payment_params
		params.require(:payment).permit(:name,:amount,:id)
	end	
end
