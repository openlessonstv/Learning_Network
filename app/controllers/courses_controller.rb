class CoursesController < ApplicationController
  def index
    @courses = Course.all
    @title = "All Courses"
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(params[:course])

    if @course.save
      redirect_to(@course, :notice => 'Course was successfully created.')
    else
      render :action => "new"
    end
  end

  def update
    if @course.update_attributes(params[:course])
      flash[:success] = "Course updated."
      redirect_to @course
    else
      @title = "Edit course"
      render 'course'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
  end


  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
    @title = "Edit Course"
  end
end
