class CreateMetricNames < ActiveRecord::Migration[6.1]
  def change
    create_table :metric_names do |t|
      t.string :title

      t.timestamps
    end
  end
end
