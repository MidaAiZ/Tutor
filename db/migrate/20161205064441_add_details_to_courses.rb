class AddDetailsToCourses < ActiveRecord::Migration
  def change
      remove_column :courses, :tutor, :string
      remove_column :courses, :class_hour, :integer
      add_column :courses, :stage, :string, default: :waiting, only: [:waiting, :rejected, :ongoing, :finished]
  end
end
