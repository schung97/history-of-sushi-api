require 'csv'
require 'date'
require_relative '../data/basic'
require_relative '../data/appreciation'
require_relative '../data/above_average'
require_relative '../data/show_off'
require_relative '../data/photos'

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
    task questionnaires: :environment do
      Questionnaire.delete_all

      CSV.foreach('./lib/project/questionnaires.csv') do |row|
        question = Questionnaire.create({ category_id: row[0], question: row[1], answer: row[2] })

        if row[2] != 'True' && row[2] != 'False'
          question.other.push(row[3],row[4], row[5])
          question.save
        end
      end
    end

    desc "Create Restaurants"
    task restaurants: :environment do
      Restaurant.delete_all

      BASIC.each do |key, r|
        Restaurant.create({ rank: "Basic", name: r['name'], rating: r['rating'], city: r['location']['city'], address: r['location']['formatted_address'], phone: r['display_phone'], review_count: r['review_count'], url: r['url'], price: r['price'] })
      end

      ABOVE_AVERAGE.each do |key, r|
        Restaurant.create({ rank: "Above-Average", name: r['name'], rating: r['rating'], city: r['location']['city'], address: r['location']['formatted_address'], phone: r['display_phone'], review_count: r['review_count'], url: r['url'], price: r['price'] })
      end

      SHOW_OFF.each do |key, r|
        Restaurant.create({ rank: "Show-off", name: r['name'], rating: r['rating'], city: r['location']['city'], address: r['location']['formatted_address'], phone: r['display_phone'], review_count: r['review_count'], url: r['url'], price: r['price'] })
      end

      APPRECIATION.each do |key, r|
        Restaurant.create({ rank: "Appreciation", name: r['name'], rating: r['rating'], city: r['location']['city'], address: r['location']['formatted_address'], phone: r['display_phone'], review_count: r['review_count'], url: r['url'], price: r['price'] })
      end

      PHOTOS.each do |r|
        res = Restaurant.find_by(name: r['name'])
        res.photos.concat(r['photos']).uniq!
        res.save
      end
    end


    desc "Create Fake Data"
    task fakedata: :environment do
      Suggestion.delete_all
      Suggestion.create({ user_id: 1, restaurant_id: 88})
      Suggestion.create({ user_id: 1, restaurant_id: 91})
      Suggestion.create({ user_id: 1, restaurant_id: 93})
      Favorite.create({ user_id: 1, restaurant_id: 88})
      Favorite.create({ user_id: 1, restaurant_id: 91})
    end


  end
end
