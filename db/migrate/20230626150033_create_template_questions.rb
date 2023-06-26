class CreateTemplateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :template_questions do |t|
      t.references :template, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
