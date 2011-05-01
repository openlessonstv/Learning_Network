class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all
    @title = "All Lessons"
  end

  def new
    @lesson = Lesson.new
    #TODO Clean this up!
    @lesson.course_id = request[:course_id]
  end

  def create
    @lesson = Lesson.new(params[:lesson])

    if @lesson.save
      redirect_to(@lesson, :notice => 'Lesson was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @lesson.update_attributes(params[:lesson])
      flash[:success] = "Lesson updated."
      redirect_to @lesson
    else
      @title = "Edit course"
      render 'course'
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
  end


  def show
    @lesson = Lesson.find(params[:id])
    redirect_to lesson_video_path (@lesson, @lesson.videos.first)
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @title = "Edit Lesson"
  end
end
