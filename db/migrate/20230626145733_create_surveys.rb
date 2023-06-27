class CreateSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :surveys do |t|
      t.string :name
      t.string :description
      t.boolean :anonymous
      t.references :user, null: false, foreign_key: true
      t.references :template, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
