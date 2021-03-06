class PaymentsController < ApplicationController
	def new
  	gon.client_token = generate_client_token
  	@reservation = Reservation.find(params[:reservation_id])
	end

	def create
  unless current_user.has_payment_info?
    @result = Braintree::Transaction.sale(
                amount: params[:price],
                payment_method_nonce: params[:payment_method_nonce],
                customer: {
                  first_name: params[:first_name],
                  last_name: params[:last_name],
                  company: params[:company],
                  email: current_user.email,
                  phone: params[:phone]
                },
                options: {
                  store_in_vault: true
                })
  else
    @result = Braintree::Transaction.sale(
                amount: params[:price],
                payment_method_nonce: params[:payment_method_nonce])
  end
  if @result.success?
    current_user.update(braintree_customer_id: @result.transaction.customer_details.id) unless current_user.has_payment_info?
    newpayment = current_user.payments.new(transaction_id: @result.transaction.id)
  	newpayment.save
  	# Need to add reservation ID to thisonce we have obtained reservation ID
  	redirect_to root_url, notice: "Congratulations! Your transaction has been successfully processed!"
  	else
    flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
    gon.client_token = generate_client_token
    render :new
  end
end



private
	def generate_client_token
  if current_user.has_payment_info?
    Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
  else
    Braintree::ClientToken.generate
  end
	end
end
