class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :score

      t.timestamps
    end
  end
end
