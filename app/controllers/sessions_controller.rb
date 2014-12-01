class SessionsController < ApplicationController
  layout 'sub'
  skip_before_filter :login_required, :only => [:new, :create, :reset]

  def create
    if user = User.authenticate(params[:email_address], params[:password])
      session[:user_id] = user.id
      redirect_to :orders
    else
      flash.now[:alert] =  t('sessions.create_alert')
      render :action => "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :login
  end

  def reset

    if request.post?
      if user = User.find_by_email_address(params[:email_address])
        user.reset_password!
        redirect_to login_path(:email_address => params[:email_address]), :notice => t('sessions.reset_notice', email_address: user.email_address)
      else
        flash.now[:alert] = t('sessions.reset_alert')
      end
    end
  end
end
