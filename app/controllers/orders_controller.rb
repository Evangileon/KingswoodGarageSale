class OrdersController < ApplicationController

  def number_items

  end

  def destroy
    current_order.destroy
    session[:order_id] = nil
    redirect_to root_path, :notice => "Shopping cart emptied."
  end

  def checkout
    @order = Shoppe::Order.find(current_order.id)
    if request.patch?
      if @order.proceed_to_confirm(params[:order].permit(:first_name, :last_name, :billing_address1, :billing_address2, :billing_address3, :billing_address4, :billing_country_id, :billing_postcode, :email_address, :phone_number))
        redirect_to checkout_payment_path
      end
    end
  end

  def payment
    if request.post?
      redirect_to checkout_confirmation_path
    end
  end

  def confirmation
    if request.post?
      current_order.confirm!
      session[:order_id] = nil
      redirect_to root_path, :notice => "Order has been placed"
    end
  end


  def delete
      if request.post?
        item = current_order.order_items.find_by_id(params[:item_id])
        item.remove
        redirect_to cart_path
      end
  end
end
