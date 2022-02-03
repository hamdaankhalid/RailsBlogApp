class FixArticleColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :articles, :titel, :title
  end
end
