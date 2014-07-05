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
#  public_token      :string(255)
#  language_version  :string(255)
#
# Indexes
#
#  index_snippets_on_parent_snippet_id  (parent_snippet_id)
#  index_snippets_on_public_token       (public_token) UNIQUE
#  index_snippets_on_user_id            (user_id)
#

class Snippet < ActiveRecord::Base
  has_paper_trail

  HasTokens.on self
  has_tokens public: 10

  belongs_to :user
  has_many :benchmark_results
  belongs_to :parent_snippet, foreign_key: :parent_snippet_id

  validates_presence_of :code

  def self.find_by_token(token)
    find_by!(public_token: token)
  end

  def fork!
    Snippet.create! code: code, parent_snippet_id: id
  end
end
