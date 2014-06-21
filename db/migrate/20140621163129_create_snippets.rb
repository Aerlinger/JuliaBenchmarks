class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.text :code
      t.string :previous_snippet_id

      t.timestamps
    end
  end
end
