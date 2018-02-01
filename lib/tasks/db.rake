require 'csv'

namespace :db do
  namespace :seed do

    desc "Import User CSV to create users and destroy previous"
    task users: :environment do
      User.delete_all

      CSV.foreach('./lib/project/users.csv') do |row|
        User.create({
          firstname: row[0],
          lastname: row[1],
          username: row[2],
          email: row[3],
          password: row[4],
          password_confirmation: row[5],
          joined_on: row[6],
          knowledge: row[7]
          })
        end
      end

    desc "Import Category CSV to create categories and destroy previous"
    task categories: :environment do
      Category.delete_all

      CSV.foreach('./lib/project/categories.csv') do |row|
        Category.create({name: row[0]})
      end
    end

    desc "Import Content CSV to create contents and destroy previous"
    task contents: :environment do
      Content.delete_all

      CSV.foreach('./lib/project/contents.csv') do |row|
        Content.create({
          category_id: row[0],
          fact: row[1]
        })
      end
    end

    desc "Import Questionnaire CSV to create questions and destroy previous"
    task contents: :environment do
      Questionnaire.delete_all

      CSV.foreach('./lib/project/questionnaires.csv') do |row|
        Questionnaire.create({
          category_id: row[0],
          question: row[1],
          answers: row[2]
        })
      end
    end


  end
end
