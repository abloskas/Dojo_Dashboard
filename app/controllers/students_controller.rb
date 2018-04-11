class StudentsController < ApplicationController
    def index
        @dojo = Dojo.find(params[:dojo_id])
        @student = @dojo.students.all
    end

    def new
        @dojo = Dojo.find(params[:dojo_id])
    end

  def create
    Student.create(student_params)
    redirect_to dojos_url
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    
  end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
  end

  def update
    @s = Student.find(params[:id])
    @s.update(student_params)
    redirect_to dojo_student_url
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy
    redirect_to dojo_students_url
  end

  private
    def student_params
      params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
    end 
end
