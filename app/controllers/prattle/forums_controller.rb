require_dependency "prattle/application_controller"

module Prattle
  class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]

    def new
      @forum = Prattle::Forum.new
      @forum.category = Prattle::Category.find(params[:category_id])
    end

    def show
      @topics = @forum.topics.by_most_recent.paginate(:page => params[:page], :per_page => 25)
    end

    def edit
    end

  	def create
  		@category = Prattle::Category.find(params[:category_id])
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

    def mark_as_read
      @forum = Prattle::Forum.find(params[:forum_id])

      @forum.topics.each do |topic|
        Prattle::TopicReadUpToMark.find_or_initialize_by(post_id: topic.posts.last.id, topic_id: topic.id, user_id: prattle_user.id).save
      end

      redirect_to [@forum.category, @forum], :flash => {:success => "All topics marked as read"}
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_forum
        @forum = Prattle::Forum.find(params[:id])
      end

  		def forum_params
    		params.require(:forum).permit(:name, :description)
  		end
	end
	
end
