require_dependency "prattle/application_controller"

module Prattle
  class TopicsController < ApplicationController
    before_action :set_topic, only: [:show, :edit, :update, :destroy]

    def show
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        @topic = Topic.find(params[:id])
      end

  		def forum_params
    		params.require(:topic).permit(:subject)
  		end
	end
	
end
