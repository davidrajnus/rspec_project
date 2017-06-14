class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :title
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
