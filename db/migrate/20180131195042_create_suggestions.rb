class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :restaurant, foreign_key: true
    end
  end
end
