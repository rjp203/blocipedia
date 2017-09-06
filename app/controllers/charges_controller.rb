class ChargesController < ApplicationController
  
  def index
  end

  def new
  end

  def create
    
    @amount = 1500
    
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]  
    )
 
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Blocipedia Premium Member',
      :currency    => 'usd'
    )
    
    current_user.update_attribute(:role, 'premium') 

    if current_user.save!
      flash[:notice] = "Thanks for upgrading, #{current_user.firstname}! You're now a lifetime #{current_user.role.capitalize} member!"
      redirect_to wikis_path
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
  
  def destroy
    
    @wikis = current_user.wikis
    @wikis.update_all(private: false)

    current_user.update_attribute(:role, 'standard')
    
    redirect_to root_path, notice: "You have cancelled your Premium membership."
  end
  
end
