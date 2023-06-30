class TemplatesController < ApplicationController
  def index
    @templates = Template.includes(template_questions: :question).all
    @survey = Survey.find(params[:survey_id])
  end
end
