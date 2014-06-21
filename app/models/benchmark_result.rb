# == Schema Information
#
# Table name: benchmark_results
#
#  id               :integer          not null, primary key
#  category         :string(255)
#  name             :string(255)
#  iterations_count :integer
#  average_duration :decimal(, )
#  max_duration     :decimal(, )
#  min_duration     :decimal(, )
#  timestamp        :integer
#  julia_sha        :string(255)
#  julia_version    :string(255)
#  code             :text
#  num_cores        :integer
#  environment_info :text
#  created_at       :datetime
#  updated_at       :datetime
#  snippet_id       :integer
#
# Indexes
#
#  index_benchmark_results_on_snippet_id  (snippet_id)
#

class BenchmarkResult < ActiveRecord::Base
  belongs_to :user, through: :snippet
  belongs_to :snippet

  def readonly?
    new_record? ? false : true
  end
end
