require 'securerandom'

class CoursesController < ApplicationController
  before_action :authenticate_user!

  before_action :set_course, only: %i[show update destroy students]

  # GET /courses
  def index
    @courses = Course.all
    json_response(@courses)
  end

  # GET /courses/1
  def show
    json_response(@course)
  end

  # GET /courses/1/students
  def students
    @students = @course.students
    json_response(@students)
  end

  # POST /courses
  def create
    @course = Course.create!(course_params.merge({ code: SecureRandom.hex(5) }))
    json_response(@course, :created)
  end

  # PATCH/PUT /courses/1
  def update
    @course.update(course_params)
    json_response(@course)
  end

  # DELETE /courses/1
  def destroy
    @course.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name)
  end
end
