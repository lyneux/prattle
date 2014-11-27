require_dependency "prattle/application_controller"

module Prattle
  class TopicsController < ApplicationController
    before_action :set_topic, only: [:show, :edit, :update, :destroy]

    def new
      @topic = Topic.new
      @post = Post.new
      @topic.forum = Forum.find(params[:forum_id])
    end

    def create
      @forum = Forum.find(params[:forum_id])
      @topic = @forum.topics.create(topic_params)
      @post = @topic.posts.create(post_params)

      @post.user = prattle_user
      @post.save

      redirect_to [@forum.category, @forum], :flash => {:success => "Topic created"}
    end

    def show
      @posts = Post.where("topic_id = " + @topic.id.to_s).paginate(:page => params[:page], :per_page => 25)
    end
 
	private

      # Use callbacks to share common setup or constraints between actions.
      def set_topic
        @topic = Topic.find(params[:id])
      end

  		def topic_params
    		params.require(:topic).permit(:subject)
  		end

      def post_params
        params.require(:post).permit(:text)
      end
	end
	
end
