class AddLangaugeVersionToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :language_version, :string
  end
end
