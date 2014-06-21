# == Schema Information
#
# Table name: snippets
#
#  id                :integer          not null, primary key
#  code              :text
#  created_at        :datetime
#  updated_at        :datetime
#  parent_snippet_id :integer
#
# Indexes
#
#  index_snippets_on_parent_snippet_id  (parent_snippet_id)
#

class Snippet < ActiveRecord::Base
  belongs_to :user
  belongs_to :benchmark_result
  belongs_to :previous_snippet_id
end
