class AddMissingForeignKeysToBenchmarkResults < ActiveRecord::Migration
  def change
    add_reference :benchmark_results, :snippet, index: true
  end
end
