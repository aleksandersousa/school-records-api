class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_result, only: %i[show update destroy]

  # GET /results
  def index
    @results = Result.all
  end

  # GET /results/1
  def show
    json_response(@result)
  end

  # POST /results
  def create
    @result = Result.create!(result_params.merge({ assign_result_date: DateTime.now }))
  end

  # PATCH/PUT /results/1
  def update
    @result.update(result_params)
  end

  # PATCH/PUT /results/1
  def destroy
    @result.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_result
    @result = Result.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def result_params
    params.require(:result).permit(:note, :type_of_result_id, :college_subject_id, :student_id)
  end
end
