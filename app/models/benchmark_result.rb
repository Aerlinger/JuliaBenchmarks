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
#

class BenchmarkResult < ActiveRecord::Base
end
