class TemplatesController < ApplicationController
  def index
    @templates = Template.includes(template_questions: :question).all
  end
end
