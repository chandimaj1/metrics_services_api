#Create sample metric names
#MetricName.create({title: "Metric A"})
#MetricName.create({title: "Metric B"})
#MetricName.create({title: "Metric C"})
#MetricName.create({title: "Metric D"})
#MetricName.create({title: "Metric E"})

for i in 0...200
    metric_name_id = Faker::Number.between(from: 1, to: 4)
    value = Faker::Number.between(from: 0, to: 100)
    created_at = Faker::Time.between_dates(from: Date.today - 10, to: Date.today, period: :all, format: :default)
    Metric.create({value:value, metric_name_id: metric_name_id, created_at: created_at})
end