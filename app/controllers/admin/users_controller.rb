module Admin
  class UsersController < ApplicationController
    before_filter { @active_nav = :users }
    before_filter { params[:id] && (@user = Admin::User.find(params[:id])) }
    before_filter(:only => [:create, :update, :destroy]) do
      if settings.demo_mode?
        raise Admin::Error, t('users.demo_mode_error')
      end
    end

    def index
      @users = Admin::User.all
    end

    def new
      @user = Admin::User.new
    end

    def create
      @user = Admin::User.new(safe_params)
      if @user.save
        redirect_to :users, :flash => {:notice => t('users.create_notice')}
      else
        render :action => "new"
      end
    end

    def edit
    end

    def update
      if @user.update(safe_params)
        redirect_to [:edit, @user], :flash => {:notice => t('users.update_notice')}
      else
        render :action => "edit"
      end
    end

    def destroy
      raise Admin::Error, t('users.self_remove_error') if @user == current_user
      @user.destroy
      redirect_to :users, :flash => {:notice => t('users.destroy_notice')}
    end

    private

    def safe_params
      params[:user].permit(:first_name, :last_name, :email_address, :password, :password_confirmation)
    end
  end
end
