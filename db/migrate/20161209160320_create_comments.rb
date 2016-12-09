class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :mark
      t.integer :manner
      t.integer :level
      t.integer :pattern
      t.string :content
      t.belongs_to :course
      t.belongs_to :student

      t.timestamps null: false
    end
  end
end
