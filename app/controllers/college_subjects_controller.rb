require 'securerandom'

class CollegeSubjectsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_college_subject, only: %i[show update destroy]

  def index
    @college_subjects = CollegeSubject.all
    json_response(@college_subjects)
  end

  def show
    json_response(@college_subject)
  end

  # POST /college_subjects
  def create
    @college_subject = CollegeSubject.create!(college_subject_params.merge({ code: SecureRandom.hex(5) }))
    json_response(@college_subject, :created)
  end

  # PATCH/PUT /college_subjects/1
  def update
    @college_subject.update(college_subject_params)
    json_response(@college_subject)
  end

  # DELETE /college_subjects/1
  def destroy
    @college_subject.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_college_subject
    @college_subject = CollegeSubject.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def college_subject_params
    params.require(:college_subject).permit(:name, :workload, :course_id)
  end
end
