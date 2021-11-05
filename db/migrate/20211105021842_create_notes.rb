class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :priority
      t.integer :user_id

      t.timestamps
    end
  end
end
