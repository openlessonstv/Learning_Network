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
    @course = Course.find(params[:id])
    
    if @course.update_attributes(params[:course])
      redirect_to(@course, :notice => 'Course was successfully updated.')
    else
      @title = "Edit course"
      render 'course'
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy
    redirect_to(courses_path, :notice => 'Course was successfully deleted.')
  end


  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
    @title = "Edit Course"
  end
end
