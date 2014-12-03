require_dependency "prattle/application_controller"

module Prattle
  class ForumsController < ApplicationController
    before_action :set_forum, only: [:show, :edit, :update, :destroy]

    def new
      @forum = Prattle::Forum.new
      @forum.category = Prattle::Category.find(params[:category_id])
    end

    def show
      @prattle_user = prattle_user
      @topics = Prattle::Topic.where(:forum_id => @forum.id).includes(:posts).order(last_post_at: :desc).paginate(:page => params[:page], :per_page => 25)
    end

    def show_recent_topics
      @prattle_user = prattle_user
      @topics = Prattle::Topic.includes(:posts).order(last_post_at: :desc).paginate(:page => params[:page], :per_page => 25)
      render :show
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
