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

require 'rails_helper'

describe Snippet do

end
