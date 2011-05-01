class VideosController < ApplicationController
  def index
    @videos = Lesson.all
    @title = "All Videos"
  end

  def new
    @lesson = Lesson.find(params[:lesson_id])
    @video = Video.new
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @video = Video.new(params[:video])
    @video.lesson_id = params[:lesson_id]

    if @video.save
      redirect_to(lesson_video_path(@lesson,@video), :notice => 'Video was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @video.update_attributes(params[:video])
      flash[:success] = "Video updated."
      redirect_to @video
    else
      @title = "Edit course"
      render 'course'
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
  end

  def show
    @video = Video.find(params[:id])
    @course = @video.lesson.course
    @lesson = @video.lesson
  end

  def edit
    @video = Video.find(params[:id])
    @title = "Edit Video"
  end
end
