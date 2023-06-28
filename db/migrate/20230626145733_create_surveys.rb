class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.boolean :anonymous
      t.string :status, default: "draft", null: false
      t.references :user, null: false, foreign_key: true
      t.references :template, null: true, foreign_key: true
      t.timestamps
    end
  end
end
