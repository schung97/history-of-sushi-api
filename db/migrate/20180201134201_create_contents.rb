class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.belongs_to :category, foreign_key: true
      t.text :fact

    end
  end
end
