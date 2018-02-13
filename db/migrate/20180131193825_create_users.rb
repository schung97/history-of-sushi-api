class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :password_digest
      t.string :knowledge, default: 'Amateur'
      t.string :avatar, default: 'https://media.giphy.com/media/xUOwG7xTFIS7K5Z12o/giphy.gif'
    end

  end
end
