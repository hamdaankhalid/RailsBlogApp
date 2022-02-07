class RenameTypeToTypeOfInExperiences < ActiveRecord::Migration[6.1]
  def change
    rename_column :experiences, :type, :type_of
  end
end
