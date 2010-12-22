class SemestersController < ApplicationController
  def show
    @semester = Semester.find(params[:id])
  end

  def new
    @semester = Semester.new
  end

  def create
    @semester = Semester.new(params[:semester])

    if @semester.save
      redirect_to(edit_semester_path(@semester), :notice => 'Semester was successfully created.')
    else
      render :action => "new"
    end
  end

  def edit
    @semester = Semester.find(params[:id])
    3.times {@semester.courses.build} if @semester.courses.blank?
  end

  def update
    @semester = Semester.find(params[:id])

    courses_attributes_params = params[:semester][:courses_attributes]
    courses_attributes_params.delete_if {|key, value| ((value[:title]).blank? && (value[:credits]).blank?) }

    if @semester.update_attributes({:courses_attributes => courses_attributes_params})
      redirect_to(semester_path(@semester), :notice => 'Courses were successfully created.')
    else
      render :action => "edit"
    end
  end
end
