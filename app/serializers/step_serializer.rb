class StepSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :step_summary
end
