class VideosController < ApplicationController
  before_filter :authorize, :only => [:new, :create, :update, :destroy, :edit]
  
  def index
    @lesson = Lesson.find(params[:lesson_id])
    @videos = @lesson.videos
    @title = "All Videos for #{@lesson.name}"
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @video = Video.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @video = Video.new(params[:video])
    @video.lesson_id = params[:lesson_id]
    @video.user_id = current_user.id
    @video.popularity = 0

    if @video.save
      redirect_to(lesson_videos_path(@video.lesson), :notice => 'Video was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @video = Video.find(params[:id])
    if @video.update_attributes(params[:video])
      redirect_to(lesson_videos_path(@video.lesson), :notice => 'Video was successfully updated.')
    else
      @title = "Edit course"
      render 'course'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to(lesson_videos_path(@video.lesson), :notice => 'Video was successfully deleted.')
  end

  def show
    @video = Video.find(params[:id])
    @course = @video.lesson.course
    @lesson = @video.lesson
  end

  def edit
    @lesson = Lesson.find(params[:lesson_id])
    @video = Video.find(params[:id])
    @title = "Edit Video"
  end

  def voteup
    Video.find(params[:id]).voteup
    render :nothing => true
  end

  def votedown
    Video.find(params[:id]).votedown
    render :nothing => true
  end
end
