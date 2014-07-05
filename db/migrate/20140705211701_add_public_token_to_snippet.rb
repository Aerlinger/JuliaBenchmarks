class AddPublicTokenToSnippet < ActiveRecord::Migration
  def change
    add_column :snippets, :public_token, :string, default: nil
    add_index :snippets, :public_token, unique: true
  end
end
