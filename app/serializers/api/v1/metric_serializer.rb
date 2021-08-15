class Api::V1::MetricSerializer < ActiveModel::Serializer
  attributes :id, :value, :created_at, :metric_name_id
  belongs_to :metric_names
end
