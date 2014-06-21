# == Schema Information
#
# Table name: snippets
#
#  id                :integer          not null, primary key
#  code              :text
#  created_at        :datetime
#  updated_at        :datetime
#  parent_snippet_id :integer
#  user_id           :integer
#
# Indexes
#
#  index_snippets_on_parent_snippet_id  (parent_snippet_id)
#  index_snippets_on_user_id            (user_id)
#

class Snippet < ActiveRecord::Base
  belongs_to :user
  has_many :benchmark_results
  belongs_to :parent_snippet, foreign_key: :parent_snippet_id
end
