class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :question, :answers
  belongs_to :category
end
