class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.belongs_to :category, foreign_key: true
      t.string :question
      t.string :answer
      t.string 'other', array: true, default: []
    end
  end
end
