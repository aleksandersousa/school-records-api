class TypeOfResultsController < ApplicationController
  before_action :set_type_of_result, only: %i[show]

  # GET /type_of_results
  def index
    @type_of_results = TypeOfResult.all
    json_response(@type_of_results)
  end

  # GET /type_of_results/:id
  def show
    json_response(@type_of_result)
  end

  private

  def set_type_of_result
    @type_of_result = TypeOfResult.find(params[:id])
  end
end
