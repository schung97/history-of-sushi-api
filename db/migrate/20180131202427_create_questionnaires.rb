class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.belongs_to :content, foreign_key: true
      t.string :question
      t.string 'answers', array: true

    end
    add_index :questionnaires, :answers, using: 'gin'
  end
end
