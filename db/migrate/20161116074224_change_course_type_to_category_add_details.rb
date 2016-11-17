class ChangeCourseTypeToCategoryAddDetails < ActiveRecord::Migration
  def change
      remove_column :courses, :type, :string
      add_column :courses, :category, :string
      add_column :courses, :class_time, :string
      add_column :courses, :class_hour, :integer
      add_column :courses, :times, :integer
      add_column :courses, :is_public, :boolean, default: :false
      add_column :courses, :intro, :string
      add_column :courses, :score, :float

  end
end
