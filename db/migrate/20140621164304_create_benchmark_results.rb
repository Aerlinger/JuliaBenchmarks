class CreateBenchmarkResults < ActiveRecord::Migration
  def change
    create_table :benchmark_results do |t|
      t.string :category
      t.string :name
      t.integer :iterations_count
      t.decimal :average_duration
      t.decimal :max_duration
      t.decimal :min_duration
      t.integer :timestamp, limit: 8
      t.string :julia_sha
      t.string :julia_version
      t.text :code
      t.integer :num_cores
      t.text :environment_info

      t.timestamps
    end
  end
end
