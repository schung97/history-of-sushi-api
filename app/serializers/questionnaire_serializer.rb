class QuestionnaireSerializer < ActiveModel::Serializer
  attributes :id, :question, :answer, :other
  belongs_to :category
end
