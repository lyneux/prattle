require_dependency "prattle/application_controller"

module Prattle
  class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]

    def new
      @forum = Forum.new
      @forum.category = Category.find(params[:category_id])
    end

    def show
    end

    def edit
    end

  	def create
  		@category = Category.find(params[:category_id])
  		@forum = @category.forums.create(forum_params)
      redirect_to [@forum.category], :flash => {:success => "Forum created"}
    end

    def update
      if @forum.update(forum_params)
        redirect_to [@forum.category, @forum], :flash => {:success => "Forum updated"}
      else
        render :edit
      end
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_forum
        @forum = Forum.find(params[:id])
      end

  		def forum_params
    		params.require(:forum).permit(:name, :description)
  		end
	end
	
end
