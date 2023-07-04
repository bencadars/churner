class QuestionsController < ApplicationController
  def update
    @survey = Survey.find(params[:survey_id])
    @question = Question.find(params[:id])
    @question.update!(question_params)
    redirect_to survey_templates_path(@survey), notice: "Question updated"
  end

  private

  def question_params
    params.require(:question).permit( :text, :boolean)
  end


end
