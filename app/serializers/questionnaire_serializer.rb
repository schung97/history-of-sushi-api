class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :question, :answer
  belongs_to :category
end
