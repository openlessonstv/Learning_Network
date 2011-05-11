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
      redirect_to(@lesson.course, :notice => 'Lesson was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    @lesson = Lesson.find(params[:id])
    if @lesson.update_attributes(params[:lesson])
      redirect_to(@lesson.course, :notice => 'Lesson was successfully updated.')
    else
      @title = "Edit course"
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy
    redirect_to(@lesson.course, :notice => 'Lesson was successfully deleted.')
  end


  def show
    @lesson = Lesson.find(params[:id])
    if @lesson.videos.any?
      redirect_to lesson_video_path (@lesson, @lesson.videos.first)
    else
      redirect_to (@lesson.course, :notice => "Lesson does not have any videos!")
    end
  end

  def edit
    @lesson = Lesson.find(params[:id])
    @title = "Edit Lesson"
  end
end
