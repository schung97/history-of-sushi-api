class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :joined_on
      t.string :knowledge, default: 'Amateur'
      t.string :avatar, default: 'https://media.giphy.com/media/xUOwG7xTFIS7K5Z12o/giphy.gif'
    end
    add_index :users, :email, unique: true
  end
end
