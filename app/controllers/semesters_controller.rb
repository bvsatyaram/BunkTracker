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
      redirect_to(@semester, :notice => 'Semester was successfully created.')
    else
      render :action => "new"
    end
  end
end
