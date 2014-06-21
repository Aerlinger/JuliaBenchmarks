class UpdateSnippetForeignKeys < ActiveRecord::Migration
  def change
    remove_column :snippets, :previous_snippet_id, :integer
    add_column :snippets, :parent_snippet_id, :integer
    add_index :snippets, :parent_snippet_id
  end
end
