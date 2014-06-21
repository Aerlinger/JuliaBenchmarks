# == Schema Information
#
# Table name: snippets
#
#  id                  :integer          not null, primary key
#  code                :text
#  previous_snippet_id :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :benchmark_result
end
