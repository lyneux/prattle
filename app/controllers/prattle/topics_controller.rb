require_dependency "prattle/application_controller"

module Prattle
  class TopicsController < ApplicationController
    before_action :set_topic, only: [:show, :edit, :update, :destroy, :lock, :unlock]
    after_action :update_topic_read_up_to_mark, only: [:show, :create]
    after_action :increment_topic_views, only: [:show]

    def new
      @topic = Topic.new
      @post = Post.new
      @topic.forum = Forum.find(params[:forum_id])
    end

    def create
      @forum = Forum.find(params[:forum_id])
      
      @topic = @forum.topics.create(topic_params)
      @topic.last_post_at = DateTime.now
      @topic.save

      @post = @topic.posts.create(post_params)
      @post.user = prattle_user
      @post.save

      redirect_to [@forum.category, @forum], :flash => {:success => "Topic created"}
    end

    def show
      @post = @topic.posts.build
      @posts = Post.where("topic_id = " + @topic.id.to_s).order(created_at: :asc).paginate(:page => params[:page], :per_page => 25)
    end

    def lock
      @topic.locked = true
      @topic.save
      redirect_to :back, :flash => {:success => "Topic locked"}
    end

    def unlock
      @topic.locked = false
      @topic.save
      redirect_to :back, :flash => {:success => "Topic unlocked"}
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        @topic = Topic.find(params[:id]) if params[:id]
        @topic = Topic.find(params[:topic_id]) if params[:topic_id]
      end

      def update_topic_read_up_to_mark
        topic_read_up_to_mark = Prattle::TopicReadUpToMark.find_or_initialize_by(topic_id: @topic.id, user_id: prattle_user.id)
        if @posts.nil?
          #We've just done a create. Assume that the whole topic is read
          topic = Prattle::Topic.find_by(id: @topic.id)
          topic_read_up_to_mark.post = topic.posts.last
        else
          #Assume we've only read to the end of the current page of posts
          topic_read_up_to_mark.post = @posts.last
        end
        topic_read_up_to_mark.save
      end

      def increment_topic_views
        topic = Prattle::Topic.find_by(id: @topic.id)
        topic.increment_views
      end

  		def topic_params
    		params.require(:topic).permit(:subject)
  		end

      def post_params
        params.require(:post).permit(:text)
      end
	end
	
end
