require_dependency "prattle/application_controller"

include Prattle::MemberSettingsHelper

module Prattle

  class MemberSettingsController < ApplicationController
    before_action :set_member_settings, only: [:edit, :update]

    def edit
      @member_settings = initialise_member_settings unless @member_settings
    end

    def update
      if @member_settings.update(member_settings_params)
        puts "Redirecting to: " + root_path
        redirect_to root_path, :flash => {:success => "Member settings updated"}
      else
        render :edit
      end
    end

  private
    def set_member_settings
      @member_settings = prattle_user.prattle_member_settings
    end

    def member_settings_params
        params.require(:member_settings).permit(:notify_all)
    end

  end
end
