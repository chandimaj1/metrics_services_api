class CreateMetrics < ActiveRecord::Migration[6.1]
  def change
    create_table :metrics do |t|
      t.references :metric_name, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
