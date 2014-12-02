module Admin
  class SettingsController < ApplicationController
    before_filter { @active_nav = :settings }

    def update
      if settings.demo_mode?
        raise Admin::Error, t('settings.demo_mode_error')
      end

      Admin::Setting.update_from_hash(params[:settings].permit!)
      redirect_to :settings, :notice => t('settings.update_notice')
    end
  end
end
