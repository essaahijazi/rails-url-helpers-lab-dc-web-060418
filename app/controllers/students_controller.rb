class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]

  def index
    @students = Student.all
  end

  def show
    if (@student.active)
      @status = "active"
    else
      @status = "inactive"
    end
  end

  def activate
    if (@student.active)
      @student.active = false
    else
      @student.active = true
    end
    @student.save

    redirect_to @student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
