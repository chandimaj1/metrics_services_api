class Api::V1::MetricNameSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :metrics
end
