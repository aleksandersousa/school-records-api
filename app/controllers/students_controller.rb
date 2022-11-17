require 'securerandom'

class StudentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_student, only: %i[show results update destroy]

  # GET /students
  def index
    @students = Student.all
  end

  # GET /students/1
  def show
    json_response(@student)
  end

  # GET /students/1/results
  def results
    @results = @student.results
  end

  # POST /students
  def create
    @student = Student.create!(student_params.merge({ registration_number: SecureRandom.hex(5) }))
  end

  # PATCH/PUT /students/1
  def update
    @student.update(student_params)
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :cpf, :avatar, :course_id)
  end
end
