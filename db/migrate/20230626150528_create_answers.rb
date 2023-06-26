class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :receiver, null: false, foreign_key: true
      t.references :survey, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.text :text
      t.boolean :boolean

      t.timestamps
    end
  end
end
